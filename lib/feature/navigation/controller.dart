import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MainScreenController extends GetxController {
  var tabIndex = 0.obs;

  void changeTab(int index) {
    tabIndex.value = index;
  }
}