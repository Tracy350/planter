/* 
AUTH GATE - YHIS WILL CONTINUOUSLY LISTEN FOR AUTH STATE CHANGES


------------------------------------------------------------------------

 unauthenticated -> Login Page
 authenticated -> Profile page


*/

import 'package:flourish/auth/screens/sign_in.dart';
import 'package:flourish/features/profile/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder(
      //Listn to auth state changes
      stream: Supabase.instance.client.auth.onAuthStateChange, 
      
      //Build approprate UI based on auth state
      builder: (context, snapshot){
        //..loading
        if(snapshot.connectionState ==ConnectionState.waiting){
          return  const Scaffold(
            body: Center(child: 
            CircularProgressIndicator()
            )
          );
        }

        //check if there is a valid session currently
        final session = snapshot.hasData ? snapshot.data!.session : null;

        if (session != null){
          return Profile(); //if there is  a session, show profile page
        }else{
          return SignInScreen();
        }
      }
      );
  }
}