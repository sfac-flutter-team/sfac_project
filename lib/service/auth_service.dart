import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  login(id, pw) => FirebaseAuth.instance
      .signInWithEmailAndPassword(email: id, password: pw)
      .then((_) => true)
      .catchError((_) => false);

  logout() => FirebaseAuth.instance.signOut();
}
