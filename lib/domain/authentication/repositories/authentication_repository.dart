abstract class AuthenticationRepository {
  Future<bool> signOut();

  Future<bool> isSignedIn();

  Future<bool> signInAnonymously();
}
