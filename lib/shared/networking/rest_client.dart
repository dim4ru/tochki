import 'package:http/http.dart' as http;
import 'api_constants.dart';

class RestClient {
  final http.Client _client = http.Client();

  Future<http.Response> wikimapiaGetNearest(double lat, double lon) async {
    final uri = Uri.parse('${ApiConstants.wikimapiaBaseUrl}/key=${ApiConstants.wikimapiaApiKey}&function=place.getnearest&lat=$lat&lon=$lon');
    return await _client.get(uri);
  }
  Future<http.Response> wikimapiaGetById(String id) async {
    final uri = Uri.parse('${ApiConstants.wikimapiaBaseUrl}/key=${ApiConstants.wikimapiaApiKey}&function=street.getbyid&id=$id');
    return await _client.get(uri);
  }
}
