class MatchModel {
  int? gameweek;
  String? date;
  String? time;
  String? homeClub;
  String? homeClubLogo;
  String? score;
  String? awayClubLogo;
  String? awayClub;
  String? venue;

  MatchModel({
    this.gameweek,
    this.date,
    this.time,
    this.homeClub,
    this.homeClubLogo,
    this.score,
    this.awayClubLogo,
    this.awayClub,
    this.venue,
  });

  static MatchModel fromJson(Map<String, dynamic> json) {
    return MatchModel(
      gameweek: json["gameweek"],
      date: json["date"],
      time: json["time"],
      homeClub: json["home_club"],
      homeClubLogo: json["home_club_logo"],
      score: json["score"],
      awayClubLogo: json["away_club_logo"],
      awayClub: json["away_club"],
      venue: json["venue"],
    );
  }
}
