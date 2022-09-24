class goal {
  String id;
  double amount;
  DateTime start_date;
  DateTime end_date;
  double pay_month;
  bool is_active;
  String user_id;

  goal(
      {required this.id,
      required this.amount,
      required this.start_date,
      required this.end_date,
      required this.pay_month,
      required this.is_active,
      required this.user_id});

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'amount': amount,
        'start_date': start_date,
        'end_date': end_date,
        'pay_month': pay_month,
        'is-active': is_active,
        'user_id': user_id
      };

  static goal fromJson(Map<String, dynamic> json) => goal(
      id: json['id'],
      amount: json['amount'],
      start_date: json['start_date'],
      end_date: json['end_date'],
      pay_month: json['pay_month'],
      is_active: json['is_active'],
      user_id: json['user_id']);
}
