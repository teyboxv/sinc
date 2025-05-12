import 'package:firebase_auth/firebase_auth.dart';

// AuthService encapsulates all authentication-related logic
class AuthService {
  // FirebaseAuth instance for authentication operations
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Holds the current user (may be null if not signed in)
  final User? currentUser = FirebaseAuth.instance.currentUser;
  
  // Signs in a user with email and password
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Returns the signed-in user
      return result.user;
    } 
    catch (e) {
      rethrow; // Propagate error if sign-in fails
    }
  }

  // Signs out the current user
  Future<void> signOut() async {
    try{
      await _auth.signOut();
      print("successfully signed out");
    }catch(e){
      print(e);
      rethrow;
    }
  }

  // Registers a new user and sets their display name
  Future<void> signUp(String email, String password,String username) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Add username to user profile
      if (_auth.currentUser != null) {
        await _auth.currentUser!
            .updateDisplayName(username);
      }
      // Sign out the user after registration
      await signOut();
    } on FirebaseAuthException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    } 
  }

  // Gets the display name of the current user
  Future<String> getUsername() async{ 
    if(_auth.currentUser != null){
      return _auth.currentUser!.displayName ?? "";
    }else{
      return "";
    }
  }
}