import 'package:flourish/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Custombuttonoutlined extends StatelessWidget {
  final VoidCallback onTap;
  final double height;
  final double width;
  final String text;
  const Custombuttonoutlined(
      {super.key,
      required this.height,
      required this.width,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration:
            BoxDecoration(border: Border.all(color: AppColors.secondary)),
        child: Center(
            child: Text(
          text,
          style: GoogleFonts.poppins(
              color: AppColors.secondary, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}
