class user {
  String id;
  String name;
  double wallet_amount;
  int points;

  user(
      {required this.id,
      required this.name,
      required this.wallet_amount,
      required this.points});

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'wallet_amount': wallet_amount,
        'points': points
      };

  static user fromJson(Map<String, dynamic> json) => user(
      id: json['id'],
      name: json['name'],
      wallet_amount: json['wallet_amount'],
      points: json['points']);
}
