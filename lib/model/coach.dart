import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Coach {
  String name;
  String photo;
  Coach({
    required this.name,
    required this.photo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'photo': photo,
    };
  }

  factory Coach.fromMap(Map<String, dynamic> map) {
    return Coach(
      name: map['name'] as String,
      photo: map['photo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Coach.fromJson(String source) =>
      Coach.fromMap(json.decode(source) as Map<String, dynamic>);
}
