class TeamStatisticModel {
  final String position;
  final String clubLogo;
  final String club;
  final String play;
  final String goal;
  final String average;

  TeamStatisticModel({
    required this.position,
    required this.clubLogo,
    required this.club,
    required this.play,
    required this.goal,
    required this.average,
  });

  static TeamStatisticModel fromJson(Map<String, dynamic> json) {
    return TeamStatisticModel(
      position: json["position"],
      clubLogo: json["club_logo"],
      club: json["club"],
      play: json["play"],
      goal: json["goal"],
      average: json["average"],
    );
  }
}
