class PlayerStatisticModel {
  final String position;
  final String avatar;
  final String name;
  final String clubLogo;
  final String play;
  final String? goals;
  final String? total;

  PlayerStatisticModel({
    required this.position,
    required this.avatar,
    required this.name,
    required this.clubLogo,
    required this.play,
    this.goals,
    this.total,
  });

  static PlayerStatisticModel fromJson(Map<String, dynamic> json) {
    return PlayerStatisticModel(
      position: json["position"],
      avatar: json["avatar"],
      name: json["name"],
      clubLogo: json["club_logo"],
      play: json["play"],
      goals: json["goals"],
      total: json["total"],
    );
  }
}
