import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //로그인
  login(id, pw) => _firebaseAuth
      .signInWithEmailAndPassword(email: id, password: pw)
      .then((_) => true)
      .catchError((_) => false);

  //로그아웃
  logout() => _firebaseAuth.signOut();

  //회원가입
  signup(id, pw, nickName) => _firebaseAuth
          .createUserWithEmailAndPassword(email: id, password: pw)
          .then(
        (_) {
          _firebaseAuth.currentUser!.updateDisplayName(nickName);
          _firebaseAuth.signOut();
          return true;
        },
      ).catchError(
        (_) => false,
      );

  //비밀번호 찾기
  resetPassword(email) => _firebaseAuth.sendPasswordResetEmail(email: email);
}
