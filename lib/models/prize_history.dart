class prize_history {
  String id;
  String prize_id;
  DateTime bought_at;
  String user_id;

  prize_history(
      {required this.id,
      required this.prize_id,
      required this.bought_at,
      required this.user_id});

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'prize_id': prize_id,
        'bought_at': bought_at,
        'user_id': user_id
      };

  static prize_history fromJson(Map<String, dynamic> json) => prize_history(
        id: json['id'],
        prize_id: json['prize_id'],
        bought_at: json['bought_at'],
        user_id: json['user_id']
      );
}
