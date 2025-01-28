import 'package:cbtdiaries_demo/domain/authentication/repositories/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthenticationRepositoryFirestore implements AuthenticationRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<bool> isSignedIn() async {
    return _firebaseAuth.currentUser != null;
  }

  @override
  Future<bool> signInAnonymously() async {
    try {
      var user = await _firebaseAuth.signInAnonymously();
      return user.user != null;
    } catch (e, s) {
      debugPrint("An exception was caught at signInAnonymously() $e\n$s");
      return false;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e, s) {
      debugPrint("An exception was caught at signOut() $e\n$s");
      return false;
    }
  }
}
