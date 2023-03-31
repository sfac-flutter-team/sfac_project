import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sfac_project/firebase_options.dart';

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

  
  //구글 로그인
  Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn(clientId: DefaultFirebaseOptions.currentPlatform.iosClientId).signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  
  // Once signed in, return the UserCredential
  return await _firebaseAuth.signInWithCredential(credential);
  
} 
}
