import 'package:sfac_project/model/team.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Fixture {
  int id; //경기 아이디
  DateTime date; //경기 날짜
  String status; //경기 상태
  Team home; //홈팀 정보
  Team away; //어웨이팀 정보
  int? homeGoals; //홈팀 득점 수
  int? awayGoals; //어웨이팀 득점 수

  Fixture({
    required this.id,
    required this.date,
    required this.status,
    required this.home,
    required this.away,
    this.homeGoals,
    this.awayGoals,
  });

  factory Fixture.fromMap(Map<String, dynamic> map) {
    return Fixture(
      id: map['id'],
      date: DateTime.parse(map['date']).add(const Duration(hours: 9)),
      status: map['status'],
      home: Team.fromMap(map['home']),
      away: Team.fromMap(map['away']),
      homeGoals: map['homeGoals'],
      awayGoals: map['awayGoals'],
    );
  }
}
