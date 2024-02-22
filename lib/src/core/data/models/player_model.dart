class PlayerModel {
  final String playerId;
  final String playerPhoto;
  final String playerName;
  final String playerNumber;
  final String position;

  PlayerModel({
    required this.playerId,
    required this.playerPhoto,
    required this.playerName,
    required this.playerNumber,
    required this.position,
  });

  static PlayerModel fromJson(Map<String, dynamic> json) {
    return PlayerModel(
      playerId: json["player_id"],
      playerPhoto: json["player_photo"],
      playerName: json["player_name"],
      playerNumber: json["player_number"],
      position: json["position"],
    );
  }
}
