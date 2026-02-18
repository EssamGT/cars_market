class AppConstants {
  static const String constantsPakage = 'constants';
  static const String assetsPackage = 'assets';
  static const String env = '.env';
  static const String mapsApiKey = 'MAPS_API_KEY';
  static const String carsImagesPathKey = 'CARS_IMAGES_PATH';
  static const String carsDataBaseKey = 'CARS_DATABASE';
  static const String usersDataBaseKey = 'USERS_DATABASE';

  static String googlePlacesAutoCompleteBaseUrl =
      "https://maps.googleapis.com/maps/api/place/autocomplete/json";

  static String getPlacesDetailsBaseUrl(String placeId) =>
      "https://places.googleapis.com/v1/places/$placeId";

  static const Duration timeoutDuration = Duration(seconds: 5);

  static String defaultCarImageUrl(String brand) =>
      'https://firebasestorage.googleapis.com/v0/b/carsmarket-8b9a8.firebasestorage.app/o/brands_logos%2F$brand.webp?alt=media&token=f87198bd-b584-4ded-9792-604882fca88d';
}
