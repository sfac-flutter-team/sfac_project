// ignore_for_file: public_member_api_docs, sort_constructors_first
class Player {
  String name; //선수 이름
  String? photo; //선수 사진
  int? number; //선수 번호
  String? pos; //포지션
  int? assists; //어시스트 횟수
  int? total; //총 득점 횟수

  Player({
    required this.name,
    this.photo,
    this.number,
    this.pos,
    this.assists,
    this.total,
  });

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      name: map['player']['name'],
      photo: map['player']['photo'] != null
          ? map['player']['photo'] as String
          : null,
      number: map['player']['number'] != null
          ? map['player']['number'] as int
          : null,
      pos: map['player']['pos'] != null ? map['player']['pos'] as String : null,
      assists: map['statistics'] != null
          ? map['statistics'].first['goals']['assists'] as int
          : null,
      total: map['statistics'] != null
          ? map['statistics'].first['goals']['total'] as int
          : null,
    );
  }
}
