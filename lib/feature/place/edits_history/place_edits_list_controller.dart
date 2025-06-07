import 'package:get/get.dart';

class PlaceEditsController extends GetxController {
  final RxList<String> edits = <String>[].obs;

  PlaceEditsController() {
    edits.addAll(['edit1edit1edit1edit1edit1edit1edit1edit1edit1edit1edit1edit1edit1edit1', 'edit2', '52.544125, 32.435533']);
  }

}