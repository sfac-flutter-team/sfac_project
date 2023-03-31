import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //회원가입
  signup(id, pw, nickName) => _firebaseAuth
          .createUserWithEmailAndPassword(email: id, password: pw)
          .then(
        (_) async {
          await _firebaseAuth.currentUser!.updateDisplayName(nickName);
          _firebaseAuth.signOut();
          return true;
        },
      ).catchError(
        (_) => false,
      );
}
