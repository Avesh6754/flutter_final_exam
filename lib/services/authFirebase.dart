
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{
  AuthServices._();
  static AuthServices authServices=AuthServices._();
  final FirebaseAuth _auth=FirebaseAuth.instance;

  Future<String?> signWithEmailAndPassWord(String email,password)
  async {
   try{
     await _auth.signInWithEmailAndPassword(email: email, password: password);
   }
   catch(e)
    {
      return e.toString();
    }
   return null;
  }

  Future<String?> createAccountWithEmailAndPassword(String email,password)
  async {
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    }
    catch(e)
    {
      return "response";
    }
    return null;
  }

  User? getCurrentUser()
  {
    User? user=_auth.currentUser;
    return user;
  }
  Future<void> signOut()
  async {
    await _auth.signOut();
  }
}