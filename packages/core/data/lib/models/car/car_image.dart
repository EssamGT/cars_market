class CarImage {
  String path;
  String url;
  CarImage({required this.path, required this.url});

  Map<String, dynamic> toJson() {
    return {'path': path, 'url': url};
  }

  CarImage.fromJson(Map<String, dynamic> json)
    : path = json['path'],
      url = json['url'];
}
