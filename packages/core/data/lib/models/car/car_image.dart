class CarImage {
  String path;
  String url;
  CarImage({required this.path, required this.url});

  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'url': url,
    };
  }
}
