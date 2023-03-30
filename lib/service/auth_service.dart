import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  login(id, pw) =>
      FirebaseAuth.instance.signInWithEmailAndPassword(email: id, password: pw);

  logout() => FirebaseAuth.instance.signOut();
}
