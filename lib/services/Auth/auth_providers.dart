import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sincapp/services/Auth/firebaseauth.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Provides an instance of AuthService for authentication logic
final authServiceProvider = Provider<AuthService>((ref) => AuthService());

// Provides the FirebaseAuth instance
final firebaseAuthProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

// StreamProvider that emits the current user whenever authentication state changes
final authStateChangesProvider = StreamProvider<User?>((ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges();
});

// FutureProvider that fetches the current user once (not reactive)
final currentUserProvider = FutureProvider<User?>((ref) async {
  final authService = ref.watch(authServiceProvider);
  return authService.currentUser;
});