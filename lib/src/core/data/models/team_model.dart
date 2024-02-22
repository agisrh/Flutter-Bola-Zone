class TeamModel {
  final String teamName;
  final String teamVenue;
  final String teamLogo;
  String? teamId;
  String? teamFounded;
  String? gamePlay;
  String? gameWin;
  String? gameDraw;
  String? gameLose;
  String? description;

  TeamModel({
    required this.teamName,
    required this.teamVenue,
    required this.teamLogo,
    this.teamId,
    this.teamFounded,
    this.gamePlay,
    this.gameWin,
    this.gameDraw,
    this.gameLose,
    this.description,
  });

  static TeamModel fromJson(Map<String, dynamic> json) {
    return TeamModel(
      teamId: json["team_id"],
      teamName: json["team_name"],
      teamFounded: json["team_founded"],
      teamVenue: json["team_venue"],
      teamLogo: json["team_logo"],
      gamePlay: json["game_play"],
      gameWin: json["game_win"],
      gameDraw: json["game_draw"],
      gameLose: json["game_lose"],
      description: json["description"],
    );
  }
}
