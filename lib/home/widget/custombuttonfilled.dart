import 'package:flourish/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Custombuttonfilled extends StatelessWidget {
  final VoidCallback onTap;
  final double height;
  final double width;
  final String text;
  final TextStyle? textStyle;
  const Custombuttonfilled(
      {super.key,
      this.textStyle,
      required this.onTap,
      required this.height,
      required this.text,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.secondary,
        ),
        height: height,
        width: width,
        child: Center(
            child: Text(
          text,
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700, fontSize: 10, color: Colors.white),
        )),
      ),
    );
  }
}
