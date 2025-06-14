import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../authorization/controller.dart';

class PhotosController extends GetxController {
  PhotosController({required this.placeId});

  final isLoading = false.obs;

  final int placeId;
  final ImagePicker _picker = ImagePicker();

  final RxList<String> uploadedUrls = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    getPhotos();
  }

  Future<void> getPhotos() async {
    try {
      final supabase = Supabase.instance.client;

      final response = await supabase
          .from('places_images')
          .select('url')
          .eq('place_id', placeId)
          .order('created_at', ascending: false);


      final List data = response as List;
      final urls = data
          .map((row) => row['url'] as String)
          .toList();

      uploadedUrls.assignAll(urls);
    } catch (e) {
      Get.snackbar('Ошибка', 'Не удалось загрузить фото: $e', snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> uploadPhoto() async {
    if (Get.find<AuthController>().guestMode) {
      Get.snackbar('Ошибка', 'Авторизуйтесь для добавления фото', snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading.value = true;
    final picked = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
      maxWidth: 1920,
      maxHeight: 1080,
    );
    if (picked == null) return;

    final file = File(picked.path);
    final fileName = basename(picked.path);
    const bucket = 'places_photos';
    final pathInBucket = 'public/$fileName';
    final supabase = Supabase.instance.client;

    try {
      await supabase.storage
          .from(bucket)
          .upload(pathInBucket, file, fileOptions: const FileOptions(
        cacheControl: '3600',
        upsert: false,
      ));

      final url = supabase.storage.from(bucket).getPublicUrl(pathInBucket);
      final user = supabase.auth.currentUser;
      if (user == null) throw 'Пользователь не авторизован';

      final inserted = await supabase
          .from('places_images')
          .insert([{
        'place_id': placeId,
        'author_id': user.id,
        'url': url,
      }])
          .select('url');

      final insertedUrl = inserted.isNotEmpty ? inserted.first['url'] as String : url;
      uploadedUrls.insert(0, insertedUrl);

      Get.snackbar('Загрузка завершена', 'Фото успешно загружено', snackPosition: SnackPosition.BOTTOM);
    } on PostgrestException catch (err) {
      Get.snackbar('Ошибка загрузки в БД', err.message, snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar('Ошибка', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
    print('end');
    isLoading.value = false;
  }
}
