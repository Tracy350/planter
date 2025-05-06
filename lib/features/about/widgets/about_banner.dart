import 'package:flourish/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutBanner extends StatelessWidget {
  const AboutBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: AppColors.primary),
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _bannercontent('🚚', 'Free Shipping', 'From all orders over \$100'),
          _bannercontent('💸', 'Free Shipping', 'From all orders over \$100'),
          _bannercontent('🎟️', 'Free Shipping', 'From all orders over \$100'),
          _bannercontent('🤝', 'Free Shipping', 'From all orders over \$100')
        ],
      ),
    );
  }
}

_bannercontent(
  String icon,
  String text,
  String subtext,
) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        icon,
        style: const TextStyle(fontSize: 30),
      ),
      const SizedBox(height: 10),
      Text(
        'Free Shipping',
        style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 20),
      ),
      const SizedBox(height: 10),
      Text(
        'Free Shipping',
        style: GoogleFonts.poppins(fontSize: 15),
      ),
    ],
  );
}
