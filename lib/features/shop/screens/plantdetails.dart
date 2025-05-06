import 'package:flourish/features/home/widget/custombuttonfilled.dart';
import 'package:flourish/features/home/widget/custombuttonoutlined.dart';
import 'package:flourish/features/shop/widgets/also_like.dart';
import 'package:flourish/features/shop/widgets/banner_tile.dart';
import 'package:flourish/features/shop/widgets/details_tab.dart';
import 'package:flourish/features/shop/widgets/related_products.dart';
import 'package:flourish/widgets/counter.dart';
import 'package:flourish/widgets/customappbar.dart';
import 'package:flourish/widgets/customfooter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlantDetailsPage extends StatefulWidget {
  final String image;
  final String name;
  final String category;
  final String price;

  const PlantDetailsPage({
    super.key,
    required this.image,
    required this.name,
    required this.category,
    required this.price,
  });

  @override
  State<PlantDetailsPage> createState() => _PlantDetailsPageState();
}

class _PlantDetailsPageState extends State<PlantDetailsPage> {
  final List<String> plantImages = const [
    'assets/plant1.jpg',
    'assets/plant2.jpg',
    'assets/plant3.jpg',
    'assets/plant4.jpg',
  ];

  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final isMobile = currentWidth > 600;

    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: isMobile
            ? Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 1, child: _buildImageSection()),
                      const SizedBox(width: 30),
                      Expanded(flex: 1, child: _buildTextSection(context)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const DetailsTab(),
                  const SizedBox(height: 20),
                  const RelatedProducts(),
                  const BannerTile(),
                  const SizedBox(height: 20),
                  const AlsoLike(),
                  CustomFooter()
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildImageSection(),
                  const SizedBox(height: 20),
                  _buildTextSection(context),
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 20),
                  const DetailsTab(),
                  const SizedBox(height: 20),
                  const RelatedProducts(),
                  const BannerTile(),
                  const SizedBox(height: 20),
                  const AlsoLike(),
                  CustomFooter()
                ],
              ),
      ),
    );
  }

  Widget _buildImageSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(widget.image,
              height: 300, width: double.infinity, fit: BoxFit.cover),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 80,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: plantImages.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (_, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  plantImages[index],
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTextSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.name,
            style:
                GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Text(widget.category,
            style: GoogleFonts.poppins(fontSize: 18, color: Colors.grey[600])),
        const SizedBox(height: 10),
        Text(widget.price,
            style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green[700])),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),
        CounterWidget(
          count: quantity,
          onChanged: (newCount) {
            setState(() {
              quantity = newCount;
            });
          },
        ),
        const SizedBox(height: 20),
        Custombuttonfilled(
          height: 50,
          width: double.infinity,
          text: 'Add to Cart',
          onTap: () {
            // Add to cart logic
          },
        ),
        const SizedBox(height: 20),
        Custombuttonoutlined(
          height: 50,
          width: double.infinity,
          text: 'Buy Now',
          onTap: () {
            // Buy now logic
          },
        ),
      ],
    );
  }
}
