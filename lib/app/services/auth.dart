import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauth/app/models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  // Instance Firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create user object based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    if (user != null) {
      return User(uid: user.uid);
    } else {
      return null;
    }
    // return user != null ? User(uid: user.uid) : null;
  }

  // User
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  // SignIn Anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      return [
        null,
        e.toString(),
      ];
    }
  }

  // Register with Email
  Future registerEmail(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      return [
        null,
        e.toString(),
      ];
    }
  }

  // Register with Email
  Future loginEmail(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      return [
        null,
        e.toString(),
      ];
    }
  }

  Future googleLogin() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount googleAccount = await googleSignIn.signIn();
      if (googleAccount != null) {
        GoogleSignInAuthentication googleAuth =
        await googleAccount.authentication;

        if (googleAuth.idToken != null && googleAuth.accessToken != null) {
          AuthResult result = await _auth.signInWithCredential(
            GoogleAuthProvider.getCredential(
              idToken: googleAuth.idToken,
              accessToken: googleAuth.accessToken,
            ),
          );
          return _userFromFirebaseUser(result.user);
        }
      }
    } catch (e) {
      return [
        null,
        e.toString(),
      ];
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return [
        null,
        e.toString(),
      ];
    }
  }
}
