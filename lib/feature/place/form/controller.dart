import 'package:latlong2/latlong.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PlaceFormController extends GetxController {
  final location = Rxn<LatLng>();
  final pointName = Rxn<String>();
  final description = Rxn<String>();
  final editComment = Rxn<String>();

  Future<void> createPlace() async {
    await Supabase.instance.client
        .from('places')
        .insert({
          'name': pointName.value,
          'description': description.value,
          'latitude': location.value!.latitude,
          'longitude': location.value!.longitude,
          //TODO INSERT AUTH ID
          'authorId' : 1337
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