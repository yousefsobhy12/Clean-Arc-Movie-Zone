import 'package:firebase_auth/firebase_auth.dart';

class FirebaseError {
  final String errorMessage;

  FirebaseError({required this.errorMessage});

  factory FirebaseError.fromFirebase(FirebaseAuthException error) {
    switch (error.code) {
      case 'user-not-found':
        return FirebaseError(
            errorMessage: 'No user found for the provided email.');
      case 'wrong-password':
        return FirebaseError(errorMessage: 'The password is incorrect.');
      case 'email-already-in-use':
        return FirebaseError(
            errorMessage: 'The email address is already in use.');
      case 'invalid-email':
        return FirebaseError(errorMessage: 'The email address is not valid.');
      case 'weak-password':
      case 'operation-not-allowed':
        return FirebaseError(errorMessage: 'This operation is not allowed.');
      case 'network-request-failed':
        return FirebaseError(
            errorMessage: 'A network error occurred. Please try again.');
      default:
        return FirebaseError(errorMessage: "Invalid email or password");
    }
  }
}