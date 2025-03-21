import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../core/dto/wikimapia_nearest_result_dto.dart';
import '../../core/dto/wikimapia_place_by_id_result_dto.dart';
import '../../core/repository.dart';
import '../../shared/api_constants.dart';

class WikimapiaController extends GetxController {
  var isLoading = false.obs;
  var placesNearest = <WikimapiaNearestResultDto>[].obs;
  late Rx<WikimapiaPlaceByIdResultDto> place;

  final Dio _dio = Dio(); // Создаём экземпляр Dio
  late WikimapiaRepository _wikimapiaRepository; // Репозиторий

  WikimapiaController() {
    _wikimapiaRepository = WikimapiaRepository(_dio);
  }

  void fetchWikimapiaPlaces() async {
    isLoading.value = true;
    try {
      final xmlResponse = await _wikimapiaRepository.getNearestPlaces(
        ApiConstants.wikimapiaApiKey,
        // TODO from db
        54.985235,
        73.368473,
      );
      placesNearest.value = WikimapiaNearestResultDtoList.fromXml(xmlResponse).places;
    } catch (e) {
      print("Error fetching places: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void getWikimapiaPlace(String id) async {
    isLoading.value = true;
    try {
      final xmlResponse = await _wikimapiaRepository.getPlaceById(
        ApiConstants.wikimapiaApiKey,
        id,
      );
      place = WikimapiaPlaceByIdResultDto.fromXml(xmlResponse).obs;
      print(place.value.urlHtml);
      print(place.value.lon);
      print(place.value.lat);
      print(place.value.description);
      print(place.value.title);
      print(place.value.id);
    } catch (e) {
      print("Error fetching places: $e");
    } finally {
      isLoading.value = false;
    }
  }


  @override
  void onInit() {
    super.onInit();
    fetchWikimapiaPlaces();
  }
}
