class GpsEndpoints {
  static String googlePlacesAutoCompleteBaseUrl =
      "https://maps.googleapis.com/maps/api/place/autocomplete/json";

  static String getPlacesDetailsBaseUrl(String placeId) =>
      "https://places.googleapis.com/v1/places/$placeId";

  static String textSearchBaseUrl =
      "https://places.googleapis.com/v1/places:searchText";
}
