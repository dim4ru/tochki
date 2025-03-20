import 'package:xml/xml.dart' as xml;

class WikimapiaNearestResultDto {
  final int id;
  final String title;
  final String url;
  final double lat;
  final double lon;

  WikimapiaNearestResultDto({
    required this.id,
    required this.title,
    required this.url,
    required this.lat,
    required this.lon,
  });

  String toXml() {
    final builder = xml.XmlBuilder();
    builder.element('places', nest: () {
      builder.element('place', nest: () {
        builder.element('id', nest: id);
        builder.element('title', nest: title);
        builder.element('url', nest: url);
        builder.element('location', nest: () {
          builder.element('lat', nest: lat);
          builder.element('lon', nest: lon);
        });
      });
    });
    return builder.buildDocument().toXmlString(pretty: true);
  }
}

class WikimapiaNearestResultDtoList {
  final List<WikimapiaNearestResultDto> places;

  WikimapiaNearestResultDtoList({required this.places});

  static WikimapiaNearestResultDtoList fromXml(String xmlString) {
    final document = xml.XmlDocument.parse(xmlString);

    // Найти все элементы <places_*> и извлечь их
    final places = document.findAllElements('places')
        .expand((element) => element.findElements('*'))
        .where((element) => element.localName.startsWith('places_') ?? false)
        .map((place) {
      return WikimapiaNearestResultDto(
        id: int.parse(place.findElements('id').first.innerText),
        title: place.findElements('title').first.innerText,
        url: place.findElements('url').first.innerText,
        lat: double.parse(place.findElements('location').first.findElements('lat').first.innerText),
        lon: double.parse(place.findElements('location').first.findElements('lon').first.innerText),
      );
    }).toList();

    return WikimapiaNearestResultDtoList(places: places);
  }
}
