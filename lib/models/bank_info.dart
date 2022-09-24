class bank_info {
  String id;
  String iban;
  String card_number;
  DateTime end_date;
  String user_id;

  bank_info(
      {required this.id,
      required this.iban,
      required this.card_number,
      required this.end_date,
      required this.user_id});
  
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'iban': iban,
        'card_number': card_number,
        'end_date': end_date,
        'user_id': user_id
      };

  static bank_info fromJson(Map<String, dynamic> json) => bank_info(
      id: json['id'],
      iban: json['iban'],
      card_number: json['iban'],
      end_date: json['end_date'],
      user_id: json['user_id']);
}
