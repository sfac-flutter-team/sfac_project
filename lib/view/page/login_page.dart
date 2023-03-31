import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sfac_project/firebase_options.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
  return await FirebaseAuth.instance.signInWithCredential(credential);
  
} 


 @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          TextField(),
          TextField(),
          ElevatedButton(onPressed: (){}, child: Text('로그인')),
          ElevatedButton(onPressed: signInWithGoogle, child: Text('구글로 로그인하기'))
        ],
      )
    );
  }
}
