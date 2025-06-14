import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../authorization/controller.dart';

class ReviewFormController extends GetxController {
  final int placeId;
  ReviewFormController({required this.placeId});

  late final TextEditingController reviewTitleFieldController;
  late final TextEditingController reviewBodyFieldController;

  final reviewTitle = Rxn<String>();
  final reviewBody = Rxn<String>();

  @override
  void onInit() {
    super.onInit();
    reviewTitleFieldController = TextEditingController(text: reviewTitle.value);
    reviewBodyFieldController = TextEditingController(text: reviewBody.value);

    reviewTitleFieldController.addListener(() {
      reviewTitle.value = reviewTitleFieldController.text;
    });
    reviewBodyFieldController.addListener(() {
      reviewBody.value = reviewBodyFieldController.text;
    });
  }

  @override
  void onClose() {
    reviewTitleFieldController.dispose();
    reviewBodyFieldController.dispose();
    super.onClose();
  }

  Future<void> createReview() async {
    try {
      await Supabase.instance.client.from('reviews').insert({
        'title': reviewTitleFieldController.text,
        'body': reviewBodyFieldController.text,
        'place_id': placeId,
        'author_id': Get.find<AuthController>().user?.id,
      });
    } on PostgrestException catch (e) {
      print(e.message);
      Get.snackbar('Ошибка создания рецензии', e.message, snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      print(e);
      Get.snackbar('Неизвестная ошибка', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }
}
