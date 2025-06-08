import 'package:flutter/cupertino.dart';
import 'package:latlong2/latlong.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../authorization/controller.dart';

class PlaceFormController extends GetxController {
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
    pointNameFieldController = TextEditingController(text: pointName.value);
    descriptionFieldController = TextEditingController(text: description.value);
    editCommentFieldController = TextEditingController(text: editComment.value);
  }

  @override
  void onClose() {
    pointNameFieldController.dispose();
    descriptionFieldController.dispose();
    editCommentFieldController.dispose();
    super.onClose();
  }

  Future<void> createPlace() async {
    await Supabase.instance.client.from('places').insert({
      'name': pointNameFieldController.text,
      'description': descriptionFieldController.text,
      'latitude': location.value!.latitude,
      'longitude': location.value!.longitude,
      'author_id': Get.find<AuthController>().user?.id,
    });
  }

  Future<void> editPlace() async {
    // await Supabase.instance.client
    //     .from('places')
    //     .update({
    //       'name': pointName.value,
    //       'description': description.value,
    //       'latitude': location.value!.latitude,
    //       'longitude': location.value!.longitude,
    //     })
    //     .eq('id', 1);
  }
}