import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginGoogleRepository {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleUser;

  Future<bool> signIn() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    bool isSuccess = false;
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    try {
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {}
    isSuccess = true;

    return isSuccess;
  }

  Future<void> signOut() async {
    googleSignIn.disconnect();
  }
}
