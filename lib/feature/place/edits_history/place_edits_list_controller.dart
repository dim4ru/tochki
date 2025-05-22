import 'package:get/get.dart';

class PlaceEditsController extends GetxController {
  final RxList<String> edits = <String>[].obs;

  PlaceEditsController() {
    edits.addAll(['edit1', 'edit2', 'edit3']);
  }

}