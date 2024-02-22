class ServiceModel {
  final String name;
  final String icon;
  final String route;
  final String image;
  final int? color;

  ServiceModel({
    required this.name,
    required this.icon,
    required this.route,
    required this.image,
    this.color,
  });

  static ServiceModel fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      name: json["name"],
      icon: json["icon"],
      route: json["route"],
      image: json["image"],
      color: json["color"],
    );
  }
}
