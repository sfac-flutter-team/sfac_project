// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:sfac_project/model/team.dart';

class Standing {
  Team team; //팀 정보
  int points; //승점
  int rank; //순위
  int played; //경기 플레이 수

  Standing({
    required this.team,
    required this.points,
    required this.rank,
    required this.played,
  });

  factory Standing.fromMap(Map<String, dynamic> map) {
    return Standing(
      team: Team.fromMap(map['team']),
      points: map['points'],
      rank: map['rank'],
      played: map['all']['played'],
    );
  }
}
