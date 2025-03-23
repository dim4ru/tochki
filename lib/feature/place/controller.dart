import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PlaceController extends GetxController {
  void onInit() {
    super.onInit();
    final placeData = Supabase.instance.client
        .from('places')
        .select();
    print(placeData);
  }
}
