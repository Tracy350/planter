import 'package:firebase_auth/firebase_auth.dart';
import 'package:flourish/models/usermodels.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // auth change user stream
  Stream<UserModel?> get onAuthStateChanged {
    return _auth
        .authStateChanges()
        //.map((User? user) => _userModelFromFirebase(user));
        .map(_userModelFromFirebase);
  }

  //create an userModel object based on Firebase User object
  UserModel? _userModelFromFirebase(User? user) {
    if (user != null) {
      return UserModel(uid: user.uid);
    } else {
      return null;
    }
  }

  //sign in anonymously, it's an asynchronous task, it's going to return a future
  Future signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userModelFromFirebase(user);
    } catch (e) {
      return null;
    }
  }

//sing in with email & password
  Future signIn(String email, String password) async{
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
}
