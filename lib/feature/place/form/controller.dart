import 'package:flutter/cupertino.dart';
import 'package:latlong2/latlong.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/dto/place_dto.dart';
import '../../authorization/controller.dart';

class PlaceFormController extends GetxController {
  final LatLng? initialLocation;
  final PlaceDTO? editingPlaceDTO;

  PlaceFormController({this.editingPlaceDTO, this.initialLocation});

  late final TextEditingController pointNameFieldController;
  late final TextEditingController descriptionFieldController;
  late final TextEditingController editCommentFieldController;

  final location = Rxn<LatLng>();
  final pointName = Rxn<String>();
  final description = Rxn<String>();
  final editComment = Rxn<String>();

  @override
  void onInit() {
    super.onInit();
    if (editingPlaceDTO != null) {
      pointName.value = editingPlaceDTO!.name;
      description.value = editingPlaceDTO!.description;
      location.value = LatLng(
        editingPlaceDTO!.latitude,
        editingPlaceDTO!.longitude,
      );
    } else {
      location.value = initialLocation;
    }

    pointNameFieldController = TextEditingController(text: pointName.value);
    descriptionFieldController = TextEditingController(text: description.value);
    editCommentFieldController = TextEditingController(text: editComment.value);

    pointNameFieldController.addListener(() {
      pointName.value = pointNameFieldController.text;
    });
    descriptionFieldController.addListener(() {
      description.value = descriptionFieldController.text;
    });
    editCommentFieldController.addListener(() {
      editComment.value = editCommentFieldController.text;
    });
  }

  @override
  void onClose() {
    pointNameFieldController.dispose();
    descriptionFieldController.dispose();
    editCommentFieldController.dispose();
    super.onClose();
  }

  Future<void> createPlace() async {
    try {
      await Supabase.instance.client.from('places').insert({
        'name': pointNameFieldController.text,
        'description': descriptionFieldController.text,
        'latitude': location.value!.latitude,
        'longitude': location.value!.longitude,
        'author_id': Get.find<AuthController>().user?.id,
      });
    } on PostgrestException catch (e) {
      print(e.message);
      Get.snackbar('Ошибка создания точки', e.message, snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      print(e);
      Get.snackbar('Неизвестная ошибка', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<bool> editPlace(PlaceDTO? oldPlaceDTO) async {
    if (oldPlaceDTO == null) {
      print('oldPlaceDTO is null');
      Get.snackbar(
        'Ошибка',
        'Не удалось получить информацию о точке',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    if(pointName.value == null || description.value == null || location.value == null || editComment.value == null) {
      print('Not all fields are filled: name: ${pointName.value}, description: ${description.value}, location: ${location.value}, comment: ${editComment.value}');
      Get.snackbar(
        'Ошибка',
        'Не все поля заполнены',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    final oldPlace = oldPlaceDTO;
    print('oldPlace: $oldPlaceDTO');

    final newPlace = PlaceDTO(
      id: oldPlaceDTO.id,
      name: pointName.value!,
      description: description.value!,
      latitude: location.value!.latitude,
      longitude: location.value!.longitude,
      createdAt: oldPlaceDTO.createdAt,
      authorId: Get.find<AuthController>().user!.id,
    );
    print('newPlace: $newPlace');

    try {
        await Supabase.instance.client
          .from('places_archive')
          .insert({
            'place_id': oldPlace.id,
            'name': oldPlace.name,
            'description': oldPlace.description,
            'latitude': oldPlace.latitude,
            'longitude': oldPlace.longitude,
            'edit_comment': editComment.value,
            'editor_id': oldPlace.authorId,
            'created_at': oldPlace.createdAt?.toIso8601String(),
          });

      await Supabase.instance.client.from('places').update({
        'name': newPlace.name,
        'description': newPlace.description,
        'latitude': newPlace.latitude,
        'longitude': newPlace.longitude,
      }).eq('id', oldPlace.id);

      print('Updated successfully');
      return true;
    } on PostgrestException catch (error) {
      print(error.message);
      Get.snackbar(
        'Ошибка архивации',
        'Не удалось сохранить старую версию точки в архив, правка отменена:\n${error.message}',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      print(e);
      Get.snackbar(
        'Неизвестная ошибка',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }
}
