import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: Text('Profile Page', style: GoogleFonts.poppins(fontSize: 50))),
    );
  }
}