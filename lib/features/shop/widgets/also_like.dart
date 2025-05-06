import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlsoLike extends StatelessWidget {
  const AlsoLike({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Also Like',
            style:
                GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600)),
        const SizedBox(height: 20),
        SizedBox(
          height: 300,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildProductCard(
                  context, 'assets/plant1.jpg', 'Plant 1', '\$10'),
              _buildProductCard(
                  context, 'assets/plant2.jpg', 'Plant 2', '\$15'),
              _buildProductCard(
                  context, 'assets/plant3.jpg', 'Plant 3', '\$20'),
            ],
          ),
        ),
      ],
    );
  }
}

_buildProductCard(
    BuildContext context, String imagePath, String name, String price) {
  return Container(
    padding: const EdgeInsets.only(right: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: 300,
          height: 200,
        ),
        Text(name,
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500)),
        Text(price,
            style:
                GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400)),
      ],
    ),
  );
}
