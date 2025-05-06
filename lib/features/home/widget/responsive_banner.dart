import 'package:flourish/features/home/widget/custombuttonfilled.dart';
import 'package:flourish/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResponsiveBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size.width;
    bool isMobile = screenSize < 600;

    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/homeimg.png',
          width: double.infinity,
          height: isMobile ? 300 : 500, // Adjust height based on screen size
          fit: BoxFit.cover,
        ),
        FractionallySizedBox(
          widthFactor: isMobile ? 0.8 : 0.6, // Responsive width
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // Makes it wrap content
              children: [
                Text(
                  'New Arrival',
                  style: GoogleFonts.poppins(fontSize: 15),
                ),
                Text(
                  'Discover Our New Collection',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? 24 : 40, // Adjust font size
                    color: AppColors.secondary,
                  ),
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis.',
                  style: GoogleFonts.poppins(fontSize: 12),
                ),
                const SizedBox(height: 20),
                Custombuttonfilled(
                  onTap: () {},
                  height: 40,
                  text: 'BUY NOW',
                  width: 100,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
