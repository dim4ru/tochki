import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserProfileController extends GetxController {
  final RxString id = ''.obs;
  final RxString name = ''.obs;
  final RxString registrationDate = ''.obs;

  final RxInt pointsCount = RxInt(0);
  final RxInt reviewsCount = RxInt(0);

  @override
  void onInit() {
    super.onInit();
    ever(id, (String newId) {
      if (newId.isNotEmpty) {
        fetchUserPlaces();
        fetchUserReviews();
      }
    });
  }

  Future<void> fetchUserPlaces() async {
    try {
      final response = await Supabase.instance.client
          .from('places')
          .select()
          .eq('author_id', id);
      final data = response as List<dynamic>;
      pointsCount.value = data.length;
    } on PostgrestException catch (e) {
      Get.snackbar(
        'Не удалось загрузить точки',
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Неизвестная ошибка',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> fetchUserReviews() async {
    try {
      final response = await Supabase.instance.client
          .from('reviews')
          .select()
          .eq('author_id', id);
      final data = response as List<dynamic>;
      reviewsCount.value = data.length;
    } on PostgrestException catch (e) {
      Get.snackbar(
        'Не удалось загрузить рецензии',
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Неизвестная ошибка',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

}