import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:sfac_project/model/fixture.dart';
import 'package:sfac_project/model/myInfo.dart';
import 'package:sfac_project/model/player.dart';
import 'package:sfac_project/model/product.dart';
import 'package:sfac_project/model/purchase.dart';
import 'package:sfac_project/model/standing.dart';
import 'package:sfac_project/model/team.dart';

class DBService {
  //유저 정보 인스턴스
  final userInfoRef = FirebaseFirestore.instance
      .collection('userInfo')
      .withConverter(
          fromFirestore: (snapshot, _) => MyInfo.fromMap(snapshot.data()!),
          toFirestore: (product, _) => product.toMap());

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

  //구매내역 인스턴스
  final purchaseRef = FirebaseFirestore.instance
      .collection('purchase')
      .withConverter(
          fromFirestore: (snapshot, _) => Purchase.fromMap(snapshot.data()!),
          toFirestore: (purchase, _) => purchase.toMap());

  //구매내역 저장
  createPurchase(Purchase purchase) => purchaseRef.add(purchase);

  //구매내역 정보 가져오기
  getPurchaseWithId(String uid) async {
    var items = await purchaseRef
        .orderBy('orderDate', descending: true)
        .where('uid', isEqualTo: uid)
        .get();
    return items.docs;
  }

  //유저 정보 생성
  createUserInfo(String uid, String nickName, String? photoURL) => userInfoRef
      .doc(uid)
      .set(MyInfo(name: nickName, photoUrl: photoURL), SetOptions(merge: true));

  //유저 프로필 사진 URL 저장
  updateUserInfoPhoto(String uid, String photoUrl) =>
      userInfoRef.doc(uid).update({'photoUrl': photoUrl});

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

  //전체 결과, 일정 날짜별로 필터링 (전체 결과 일정을 저장해 놓고 필터링을 하는게 더 좋을 것 같다.)
  readFixturesWithDate(DateTime date) => fixtureRef.get().then((value) {
        List fixtures = value.docs.first.data();
        return fixtures
            .where((e) =>
                DateFormat('dd-MM-yyyy').format(e.date) ==
                DateFormat('dd-MM-yyyy').format(date))
            .toList();
      }).catchError((e) => print(e));

  //팀 가장 최근 경기 결과 (전체 결과 일정을 저장해 놓고 필터링을 하는게 더 좋을 것 같다.)
  getLastFixturesWithTeamId(int teamId) => fixtureRef.get().then((value) {
        List fixtures = value.docs.first.data();
        var result = fixtures
            .where((e) =>
                (e.home.id == teamId || e.away.id == teamId) &&
                e.date.isBefore(DateTime.now()))
            .toList();
        return result.last;
      }).catchError((e) => print(e));

  //팀 바로 다음 일정 조회 (전체 결과 일정을 저장해 놓고 필터링을 하는게 더 좋을 것 같다.)
  getNextScheduleWithTeamId(int teamId) => fixtureRef.get().then((value) {
        List fixtures = value.docs.first.data();
        var result = fixtures
            .where((e) =>
                (e.home.id == teamId || e.away.id == teamId) &&
                e.date.isAfter(DateTime.now()))
            .toList();
        return result.first;
      }).catchError((e) => print(e));

  Future<List<QueryDocumentSnapshot<Product>>> readProduct() async {
    var items = await productRef.get();
    return items.docs;
  }

  Future<List<QueryDocumentSnapshot<Product>>> getProduct(
      String productId) async {
    var data = await productRef.where('productID', isEqualTo: productId).get();
    return data.docs;
  }

  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> getUserInfo(String userId) async {
    var result = await db.collection("userInfo").doc(userId).get();
    return result.data()!;
  }

  Future<void> updateUserInfoTeamId(String userId, int teamId) async {
    await db.collection("userInfo").doc(userId).update({"teamId": teamId});
  }

  Future<void> deleteComment(String commentId, String teamId) async {
    var messageRef = db.collection('teams/$teamId/messages').doc(commentId);
    await messageRef.delete();
  }

  Stream<QuerySnapshot> getData(String userId, String teamId) {
    var currentUserRef = db.collection("userInfo").doc(userId);
    return db
        .collection('teams/$teamId/messages')
        .where('myInfo', isEqualTo: currentUserRef)
        .orderBy('sendDate', descending: true)
        .snapshots();
  }
}
