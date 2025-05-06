import 'package:flourish/features/home/widget/custombuttonfilled.dart';
import 'package:flourish/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Customheader extends StatelessWidget {
  final String currentpage;
  final String pagepath;
    const Customheader({super.key, required this.currentpage, required this.pagepath});
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size.width;
    bool isMobile = screenSize < 600;

    return Stack(
      children: [
        // Background Image with Transparency
        Image.asset(
          'assets/homeimg.png',
          width: double.infinity,
          height: isMobile ? 300 : 500,
          fit: BoxFit.cover,
          color: Colors.white.withOpacity(0.5),
          colorBlendMode: BlendMode.modulate,
        ),

        // Centered Content
        Positioned(
          top: isMobile ? 100 : 200, // Adjust position based on screen size
          left: 0,
          right: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/logo.png'),
              Text(
                currentpage,
                style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Text(
                pagepath,
                style: GoogleFonts.poppins(fontSize: 16),
              ),
            ],
          ),
        ),

        // Bottom Container (Fixed at the Bottom)
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            color: AppColors.primary,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.filter_alt),
                    const SizedBox(width: 5),
                    Text('Filter', style: GoogleFonts.poppins()),
                  ],
                ),
                const VerticalDivider(color: Colors.white),
                Text('Showing 1–16 of 32 results', style: GoogleFonts.poppins()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
