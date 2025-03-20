import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../core/dto/wikimapia_nearest_result_dto.dart';
import '../../core/repository.dart';
import '../../shared/api_constants.dart';

class WikimapiaController extends GetxController {
  var isLoading = false.obs;
  var placesNearest = <WikimapiaNearestResultDto>[].obs;


  final Dio _dio = Dio(); // Создаём экземпляр Dio
  late WikimapiaRepository _wikimapiaRepository; // Репозиторий

  WikimapiaController() {
    _wikimapiaRepository = WikimapiaRepository(_dio); // Передаем Dio в репозиторий
  }

  // Симуляция запроса на сервер (например, с использованием Dio и Retrofit)
  void fetchWikimapiaPlaces() async {
    isLoading.value = true;
    try {
      // Вызываем метод репозитория для получения ближайших мест
      final xmlResponse = await _wikimapiaRepository.getNearestPlaces(
        ApiConstants.wikimapiaApiKey,
        // TODO from db
        54.985235,
        73.368473,
      );
      placesNearest.value = WikimapiaNearestResultDtoList.fromXml(xmlResponse).places;
    } catch (e) {
      // Обработка ошибок
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
