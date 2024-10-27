import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // instance of auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //get the current user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  //email sign in
  Future<UserCredential> signInWithEmailPassword(
      String email, String password) async {
    try {
      // sign user in
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // email sign up
  Future<UserCredential> signUpWithEmailPassword(
      String email, String password) async {
    try {
      // create user
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // sign out
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  // Google sign in
  signInWithGoogle() async {
    // begin with interactive sign in
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    if (gUser == null) {
      print('User canceled the sign-in process.');
      return null; // Return if the user cancels
    }

    //obtain auth details from the request
    final GoogleSignInAuthentication gAuth = await gUser.authentication;

    //create a new credential for a new user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    return await _firebaseAuth.signInWithCredential(credential);
  }

  String getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'Exception: wrong-password':
        return 'The password is incorrect. Please try again';
      case 'Exception: user-not-found':
        return 'No user found with this email. Please Sign Up';
      case 'Exception: invalid email':
        return 'This email does not exist';
      default:
        return 'An unexpected error occured. Please try again later';
    }
  }
}
