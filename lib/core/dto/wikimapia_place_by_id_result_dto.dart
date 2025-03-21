import 'package:xml/xml.dart' as xml;


class WikimapiaPlaceByIdResultDto {
  final int id;
  final String title;
  final String description;
  final double lat;
  final double lon;
  final String url;

  WikimapiaPlaceByIdResultDto({
    required this.id,
    required this.title,
    required this.description,
    required this.lat,
    required this.lon,
    required this.url,
  });

  factory WikimapiaPlaceByIdResultDto.fromXml(String xmlString) {
    final document = xml.XmlDocument.parse(xmlString);
    final wm = document.getElement('wm');

    RegExp urlHtmlRegExp = RegExp(r'href="([^"]+)"');

    return WikimapiaPlaceByIdResultDto(
      id: int.parse(wm?.getElement('id')?.innerText ?? '0'),
      title: wm?.getElement('title')?.innerText ?? '',
      description: wm?.getElement('description')?.innerText ?? '',
      lat: double.parse(wm?.getElement('location')?.getElement('lat')?.innerText ?? '0'),
      lon: double.parse(wm?.getElement('location')?.getElement('lon')?.innerText ?? '0'),
      url: urlHtmlRegExp.firstMatch(wm?.getElement('urlhtml')?.innerText ?? '')?.group(1) ?? '',
    );
  }
}