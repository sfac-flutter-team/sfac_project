// ignore_for_file: public_member_api_docs, sort_constructors_first
class Team {
  int id; //팀 아이디
  String logo; //팀 로고 URL
  String name; //팀 이름

  Team({
    required this.id,
    required this.logo,
    required this.name,
  });

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
      id: map['id'] as int,
      logo: map['logo'] as String,
      name: map['name'] as String,
    );
  }
}
//Get.toNamed('/event', arguments: {'teamInfo': 'teamInfo'})