import 'package:chat/src/core/shared/widgets/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      dynamic User = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } catch (e) {
      Toast.errorToast(e.toString());
    }
    return false;
  }

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      dynamic User = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } catch (e) {
      Toast.errorToast(e.toString());
    }
    return false;
  }

  Future signOut() async {
    await _auth.signOut();
  }
}
