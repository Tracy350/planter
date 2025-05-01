import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewCard extends StatelessWidget {
  final String name;
  final String job;
  final String profileImage;
  final int rating; // 1-5
  final String title;
  final String description;

  const ReviewCard({
    Key? key,
    required this.name,
    required this.job,
    required this.profileImage,
    required this.rating,
    required this.title,
    required this.description,
  }) : super(key: key);

  Widget buildStar(int filledCount) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          Icons.star,
          color: index < filledCount ? Colors.amber : Colors.grey[300],
          size: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(profileImage),
                radius: 25,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 16)),
                  Text(job,
                      style: GoogleFonts.poppins(
                          fontSize: 12, color: Colors.grey[600])),
                  buildStar(rating),
                ],
              ),
              const Spacer(), // Push the quote icon to the far right
              Padding(
                padding: const EdgeInsets.only(
                    top: 4.0), // Align vertically with text
                child: Icon(
                  Icons.format_quote,
                  size: 30,
                  color: Colors.grey[300],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Review Content
          Text(
            title,
            style: GoogleFonts.dmSerifDisplay(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
