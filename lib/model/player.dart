// ignore_for_file: public_member_api_docs, sort_constructors_first
class Player {
  String name; //선수 이름
  String photo; //선수 사진
  int assists; //어시스트 횟수
  int total; //총 득점 횟수

  Player({
    required this.name,
    required this.photo,
    required this.assists,
    required this.total,
  });

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      name: map['player']['name'],
      photo: map['player']['photo'],
      assists: map['statistics'].first['goals']['assists'],
      total: map['statistics'].first['goals']['total'],
    );
  }
}
