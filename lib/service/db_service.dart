import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sfac_project/model/fixture.dart';
import 'package:sfac_project/model/player.dart';
import 'package:sfac_project/model/product.dart';
import 'package:sfac_project/model/standing.dart';
import 'package:sfac_project/model/team.dart';

class DBService {
  //상품 인스턴스
  final productRef = FirebaseFirestore.instance
      .collection('product')
      .withConverter(
          fromFirestore: (snapshot, _) => Product.fromMap(snapshot.data()!),
          toFirestore: (product, _) => product.toMap());

  //팀 인스턴스
  final teamRef = FirebaseFirestore.instance.collection('teams').withConverter(
      fromFirestore: (snapshot, _) => Team.fromMap(snapshot.data()!['team']),
      toFirestore: (team, _) => {});

  //순위 인스턴스
  final standingRef = FirebaseFirestore.instance
      .collection('standings')
      .withConverter(
          fromFirestore: (snapshot, _) => Standing.fromMap(snapshot.data()!),
          toFirestore: (standing, _) => {});

  //선수 득점순위 인스턴스
  final playerRef = FirebaseFirestore.instance
      .collection('players')
      .withConverter(
          fromFirestore: (snapshot, _) => snapshot
              .data()!['topscorers']
              .map((value) => Player.fromMap(value))
              .toList(),
          toFirestore: (player, _) => {});

  // 선수 득점순위 인스턴스
  final fixtureRef = FirebaseFirestore.instance
      .collection('fixtures')
      .withConverter(
          fromFirestore: (snapshot, _) => snapshot
              .data()!['fixtures']
              .map((value) => Fixture.fromMap(value))
              .toList(),
          toFirestore: (fixture, _) => {});

  //전체 팀 정보 가져오기
  readTeams() =>
      teamRef.get().then((value) => value.docs).catchError((e) => print(e));

  //팀 id로 팀 정보 가져오기
  getTeamWithId(int teamId) => teamRef
      .where('team.id', isEqualTo: teamId)
      .get()
      .then((value) => value.docs.first)
      .catchError((e) => print(e));

  //전체 순위 가져오기
  readStandings() => standingRef
      .orderBy('rank')
      .get()
      .then((value) => value.docs)
      .catchError((e) => print(e));

  //팀 아이디로 순위 가져오기
  getStandingWithId(int teamId) => standingRef
      .where('team.id', isEqualTo: teamId)
      .get()
      .then((value) => value.docs.first)
      .catchError((e) => print(e));

  //전체 선수 득점 순위 가져오기
  readTopScorers() => playerRef
      .get()
      .then((value) => value.docs.first)
      .catchError((e) => print(e));

  //전체 결과, 일정 가져오기
  readFixtures() => fixtureRef
      .get()
      .then((value) => value.docs.first)
      .catchError((e) => print(e));
}
