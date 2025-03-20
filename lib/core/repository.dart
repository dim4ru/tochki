import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:json_annotation/json_annotation.dart';
import '../shared/api_constants.dart';
import 'models/wikimapia_place.dart';

part 'repository.g.dart';

@RestApi(baseUrl: ApiConstants.wikimapiaBaseUrl)
abstract class WikimapiaRepository {
  factory WikimapiaRepository(Dio dio, {String baseUrl}) = _WikimapiaRepository;

  // Метод для получения ближайших мест
  @GET('/?key={apiKey}&function=place.getnearest&lat={lat}&lon={lon}')
  Future<List<WikimapiaPlace>> getNearestPlaces(
      @Path("apiKey") String apiKey,
      @Path("lat") double lat,
      @Path("lon") double lon,
      );

  // Метод для получения информации о месте по ID
  @GET('/?key={apiKey}&function=place.getbyid&id={id}')
  Future<WikimapiaPlace> getPlaceById(
      @Path("apiKey") String apiKey,
      @Path("id") String id,
      );
}
