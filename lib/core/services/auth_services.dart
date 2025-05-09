// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flourish/models/usermodels.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//     final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   // auth change user stream
//   Stream<UserModel?> get onAuthStateChanged {
//     return _auth
//         .authStateChanges()
//         //.map((User? user) => _userModelFromFirebase(user));
//         .map(_userModelFromFirebase);
//   }

//   //create an userModel object based on Firebase User object
//   UserModel? _userModelFromFirebase(User? user) {
//     if (user != null) {
//       return UserModel(uid: user.uid);
//     } else {
//       return null;
//     }
//   }

//   //sign in anonymously, it's an asynchronous task, it's going to return a future
//   Future signInAnonymously() async {
//     try {
//       UserCredential result = await _auth.signInAnonymously();
//       User? user = result.user;
//       return _userModelFromFirebase(user);
//     } catch (e) {
//       return null;
//     }
//   }

// //sing in with email & password
// Future signIn(String email, String password) async {
//   if (email.isEmpty || password.isEmpty) {
//     print('Email and password must not be empty');
//     return null;
//   }

//   try {
//     UserCredential result = await _auth.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     return _userModelFromFirebase(result.user);
//   } catch (e) {
//     print('Error during sign-in: ${e.toString()}');
//     return null;
//   }
// }

//   Future signUp(String email, String password, String firstName, String lastName, String phoneNumber) async {
//     try {
//       UserCredential result = await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       User user = result.user!;

//       // Store additional user info in Firestore
//       await _firestore.collection('users').doc(user.uid).set({
//         'uid': user.uid,
//         'email': email,
//         'firstName': firstName,
//         'lastName': lastName,
//         'phoneNumber': phoneNumber,
//         'createdAt': Timestamp.now(),
//       });

//       // Optional: Update FirebaseAuth displayName
//       await user.updateDisplayName('$firstName $lastName');

//       return user;
//     } catch (e) {
//       print('SignUp Error: ${e.toString()}');
//       return null;
//     }
//   }

//      //sing out
//   Future signOut() async{
//     try{
//       return await _auth.signOut();
//     }
//     catch(e){
//       print(e.toString());
//       return null;
//     }
//   }
// }



import 'package:supabase_flutter/supabase_flutter.dart';

class AuthServices {
  final SupabaseClient _supabase = Supabase.instance.client;


  //Sign up with email and password
  Future<AuthResponse>signInWithEmailAndPassword(String email, String password)async{
return await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  //Sign up with email and password
  Future<AuthResponse> signUpWithEmailAndPassword(String email, String password) async {
    return await _supabase.auth.signUp(
      email: email,
      password: password,
    );
  }
  //Sign out
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }
  //Get current user
  String? getCurrentUserEmail(){
    final session = _supabase.auth.currentSession;
    final user = session?.user;
    return user?.email;
  }
}