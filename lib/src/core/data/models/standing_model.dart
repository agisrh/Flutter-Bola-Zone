class StandingModel {
  final String position;
  final String logo;
  final String club;
  final String matches;
  final String win;
  final String draw;
  final String lose;
  final String goals;
  final String form;
  final String points;

  StandingModel({
    required this.position,
    required this.logo,
    required this.club,
    required this.matches,
    required this.win,
    required this.draw,
    required this.lose,
    required this.goals,
    required this.form,
    required this.points,
  });

  static StandingModel fromJson(Map<String, dynamic> json) {
    return StandingModel(
      position: json["position"],
      logo: json["logo"],
      club: json["club"],
      matches: json["matches"],
      win: json["win"],
      draw: json["draw"],
      lose: json["lose"],
      goals: json["goals"],
      form: json["form"],
      points: json["points"],
    );
  }
}
