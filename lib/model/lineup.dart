// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sfac_project/model/coach.dart';
import 'package:sfac_project/model/player.dart';
import 'package:sfac_project/model/team.dart';

class Lineup {
  Team team;
  Coach coach;
  List<Player> players;
  List<Player> substitutes;
  Lineup({
    required this.team,
    required this.coach,
    required this.players,
    required this.substitutes,
  });

  factory Lineup.fromMap(Map<String, dynamic> map) {
    return Lineup(
      team: Team.fromMap(map['team'] as Map<String, dynamic>),
      coach: Coach.fromMap(map['coach'] as Map<String, dynamic>),
      players: List<Player>.from(
        (map['startXI'] as List<dynamic>).map<Player>(
          (x) => Player.fromMap(x as Map<String, dynamic>),
        ),
      ),
      substitutes: List<Player>.from(
        (map['substitutes'] as List<dynamic>).map<Player>(
          (x) => Player.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
