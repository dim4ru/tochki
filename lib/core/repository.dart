import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../shared/api_constants.dart';

part 'repository.g.dart';

@RestApi(baseUrl: ApiConstants.wikimapiaBaseUrl)
abstract class WikimapiaRepository {
  factory WikimapiaRepository(Dio dio, {String baseUrl}) = _WikimapiaRepository;

  /// Wikimapia API Place.Getnearest
  @GET('/?key={apiKey}&function=place.getnearest&lat={lat}&lon={lon}')
  Future<String> getNearestPlaces(
      @Path("apiKey") String apiKey,
      @Path("lat") double lat,
      @Path("lon") double lon,
      );

  /// Wikimapia API Place.Getbyid
  @GET('/?key={apiKey}&function=place.getbyid&id={id}')
  Future<String> getPlaceById(
      @Path("apiKey") String apiKey,
      @Path("id") String id,
      );
}
