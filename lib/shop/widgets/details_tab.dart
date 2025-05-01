import 'package:flourish/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsTab extends StatelessWidget {
  const DetailsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            labelStyle: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
            unselectedLabelStyle: GoogleFonts.poppins(
              fontSize: 16,
            ),
            indicatorColor: AppColors.green,
            labelColor: AppColors.green,
            tabs: const [
              Tab(text: 'Description'),
              Tab(text: 'Care Instructions'),
              Tab(text: 'Reviews'),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 300,
            child: TabBarView(
              children: [
                _buildDescription(),
                _buildCareInstructions(),
                _buildReviews(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildDescription() {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Text(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      style: GoogleFonts.poppins(fontSize: 12),
    ),
  );
}

Widget _buildCareInstructions() {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("☀️ Sunlight: Bright, indirect light",
            style: GoogleFonts.poppins(fontSize: 16)),
        const SizedBox(height: 10),
        Text("💧 Water: Once a week", style: GoogleFonts.poppins(fontSize: 16)),
        const SizedBox(height: 10),
        Text("🌡️ Temperature: 18-24°C",
            style: GoogleFonts.poppins(fontSize: 16)),
        const SizedBox(height: 10),
        Text("🪴 Soil: Well-draining potting mix",
            style: GoogleFonts.poppins(fontSize: 16)),
      ],
    ),
  );
}

Widget _buildReviews() {
  return ListView(
    padding: const EdgeInsets.all(16),
    children: [
      _buildReviewItem(
        name: "John Doe",
        rating: 4.5,
        review: "Great plant! It has added so much life to my living room.",
      ),
      _buildReviewItem(
        name: "Jane Smith",
        rating: 5.0,
        review:
            "Absolutely love this plant! It's easy to care for and looks amazing.",
      ),
    ],
  );
}

Widget _buildReviewItem({
  required String name,
  required double rating,
  required String review,
}) {
  return Card(
    margin: const EdgeInsets.only(bottom: 10),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: List.generate(
              rating.toInt(),
              (index) => const Icon(Icons.star, color: Colors.amber, size: 16),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            review,
            style: GoogleFonts.poppins(fontSize: 14),
          ),
        ],
      ),
    ),
  );
}
