import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  login(id, pw) =>
      FirebaseAuth.instance
      .signInWithEmailAndPassword(email: id, password: pw)
      .then((value) => )    //로그인이 종료되면 실행
      .catchError();     //로그인이 에러뜨면 실행

  logout() => FirebaseAuth.instance.signOut();
}
