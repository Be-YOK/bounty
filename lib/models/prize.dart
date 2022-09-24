class prize {
  String id;
  String category;
  String name;
  String description;
  int points_needed;
  String image_url;

  prize(
      {required this.id,
      required this.category,
      required this.name,
      required this.description,
      required this.points_needed,
      required this.image_url});

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'category': category,
        'name': name,
        'description': description,
        'points-needed': points_needed,
        'image_url': image_url
      };

  static prize fromJson(Map<String, dynamic> json) => prize(
        id: json['id'],
        category: json['category'],
        name: json['name'],
        description: json['description'],
        points_needed: json['points_needed'],
        image_url: json['image_url'],
      );
}
