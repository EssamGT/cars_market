import 'package:google_maps_flutter/google_maps_flutter.dart';

class TextSearchModelResponse {
  final List<TextSearchModel> places;
  TextSearchModelResponse({required this.places});
  factory TextSearchModelResponse.fromJson(Map<String, dynamic> json) {
    var resultsJson = json['places'] as List<dynamic>? ?? [];
    List<TextSearchModel> results = resultsJson
        .map((resultJson) => TextSearchModel.fromJson(resultJson))
        .toList();
    return TextSearchModelResponse(places: results);
  }
}

class TextSearchModel {
  final String formattedAddress;
  final LatLng location;
  final DisplayName displayName;
  final GoogleMapsLinks googleMapsLinks;
  const TextSearchModel({
    required this.formattedAddress,
    required this.location,
    required this.displayName,
    required this.googleMapsLinks,
  });
  factory TextSearchModel.fromJson(Map<String, dynamic> json) {
    final displayNameJson = json['displayName'] as Map<String, dynamic>? ?? {};
    final locationJson = json['location'] as Map<String, dynamic>? ?? {};

    return TextSearchModel(
      formattedAddress: json['formattedAddress'] as String? ?? '',
      location: LatLng(
        (locationJson['latitude'] as num?)?.toDouble() ?? 0.0,
        (locationJson['longitude'] as num?)?.toDouble() ?? 0.0,
      ),
      displayName: DisplayName(
        text: displayNameJson['text'] as String? ?? '',
        languageCode: displayNameJson['languageCode'] as String? ?? '',
      ),
      googleMapsLinks: GoogleMapsLinks.fromJson(json['googleMapsLinks'] ?? {}),
    );
  }

  TextSearchModel.empty()
    : formattedAddress = '',
      location = const LatLng(0.0, 0.0),
      displayName = const DisplayName(text: '', languageCode: ''),
      googleMapsLinks = const GoogleMapsLinks(
        directionsUri: '',
        placeUri: '',
        photosUri: '',
      );

  Map<String, dynamic> toJson() {
    return {
      "formattedAddress": formattedAddress,
      "location": {
        "latitude": location.latitude,
        "longitude": location.longitude,
      },
      "displayName": {
        "text": displayName.text,
        "languageCode": displayName.languageCode,
      },
      "googleMapsLinks": googleMapsLinks.toJson(),
    };
  }
}

class DisplayName {
  final String text;
  final String languageCode;
  const DisplayName({required this.text, required this.languageCode});
}

class GoogleMapsLinks {
  final String directionsUri;
  final String placeUri;
  final String photosUri;
  const GoogleMapsLinks({
    required this.directionsUri,
    required this.placeUri,
    required this.photosUri,
  });
  factory GoogleMapsLinks.fromJson(Map<String, dynamic> json) {
    return GoogleMapsLinks(
      directionsUri: json['directionsUri'] ?? '',
      placeUri: json['placeUri'] ?? '',
      photosUri: json['photosUri'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "directionsUri": directionsUri,
      "placeUri": placeUri,
      "photosUri": photosUri,
    };
  }
}
