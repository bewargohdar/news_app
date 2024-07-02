class Source {
  String? id;
  String name;

  Source({
    required this.id,
    required this.name,
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  Source.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
}
