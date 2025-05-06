import 'package:flourish/features/home/widget/custombuttonfilled.dart';
import 'package:flourish/features/home/widget/custombuttonoutlined.dart';
import 'package:flourish/features/home/widget/freeformimage.dart';
import 'package:flourish/features/home/widget/responsive_banner.dart';
import 'package:flourish/widgets/customappbar.dart';
import 'package:flourish/widgets/customfooter.dart';
import 'package:flourish/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> products = [
      {
        'image': 'assets/plant1.jpg',
        'name': 'Nike Air',
        'category': 'Shoes',
        'price': '\$120'
      },
      {
        'image': 'assets/plant2.jpg',
        'name': 'Leather Bag',
        'category': 'Bags',
        'price': '\$200'
      },
      {
        'image': 'assets/plant3.jpg',
        'name': 'Rolex Watch',
        'category': 'Watches',
        'price': '\$1500'
      },
      {
        'image': 'assets/plant4.jpg',
        'name': 'Denim Jacket',
        'category': 'Clothing',
        'price': '\$80'
      },
      {
        'image': 'assets/plant1.jpg',
        'name': 'Sneakers',
        'category': 'Shoes',
        'price': '\$100'
      },
      {
        'image': 'assets/plant2.jpg',
        'name': 'Sunglasses',
        'category': 'Accessories',
        'price': '\$60'
      },
      {
        'image': 'assets/plant3.jpg',
        'name': 'Backpack',
        'category': 'Bags',
        'price': '\$90'
      },
      {
        'image': 'assets/plant4.jpg',
        'name': 'Smartwatch',
        'category': 'Watches',
        'price': '\$250'
      },
    ];
    final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ResponsiveBanner(),
            const SizedBox(height: 30),
            Text(
              'Browse the Range',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700, fontSize: 30),
            ),
            const SizedBox(height: 10),
            Text(
              'Explore our latest collection of products.',
              style: GoogleFonts.poppins(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 400,
              child: ListView(
                scrollDirection: Axis.horizontal,
                // currentWidth > 600 ? Axis.horizontal : Axis.vertical,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _buildRangeImage('assets/range1.png', 'Indoor'),
                  _buildRangeImage('assets/range2.png', 'Outdoor'),
                  _buildRangeImage('assets/range3.png', 'Cacti and Succulents'),
                ],
              ),
            ),
            Custombuttonoutlined(
                onTap: () {}, height: 40, text: 'Show More', width: 150),
            const SizedBox(height: 30),
            Text(
              'Our Products',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700, fontSize: 30),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: currentWidth > 600 ? 4 : 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.9,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return _buildProductCard(
                    products[index]['image']!,
                    products[index]['name']!,
                    products[index]['category']!,
                    products[index]['price']!,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Custombuttonoutlined(
                onTap: () {}, height: 40, text: 'Show More', width: 150),
            const SizedBox(height: 30),
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(color: AppColors.primary),
              child: Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '100+ Beautiful plant decor',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: AppColors.secondary),
                        ),
                        Text(
                          'Our designer already made a lot of beautiful \n prototipe of rooms that inspire you',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Custombuttonfilled(
                            onTap: () {},
                            height: 50,
                            text: 'Explore More',
                            width: 100)
                      ],
                    )
                  ],
                ),
              ),
            ),
            Text(
              'Share your setup with',
              style: GoogleFonts.poppins(
                fontSize: 20,
              ),
            ),
            Text(
              '#PlantGrowth',
              style: GoogleFonts.poppins(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: AppColors.green),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(height: 700, child: WaterfallGallery()),
            ),
            const SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.grey[300],
            ),
            CustomFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildRangeImage(String image, String text) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double imageHeight = constraints.maxWidth < 600 ? 200 : 300;
        double imageWidth = constraints.maxWidth < 600 ? 150 : 200;
        double fontSize = constraints.maxWidth < 600 ? 16 : 20;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  image,
                  height: imageHeight,
                  width: imageWidth,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProductCard(
      String image, String name, String category, String price) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double imageHeight = constraints.maxWidth < 600 ? double.infinity : 250;
        double imageWidth = constraints.maxWidth < 600 ? double.infinity : 140;
        double nameFontSize = constraints.maxWidth < 600 ? 14 : 16;
        double categoryFontSize = constraints.maxWidth < 600 ? 12 : 14;
        double priceFontSize = constraints.maxWidth < 600 ? 14 : 16;

        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                image,
                width: imageWidth,
                height: imageHeight,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.poppins(
                        fontSize: nameFontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      category,
                      style: GoogleFonts.poppins(
                        fontSize: categoryFontSize,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      price,
                      style: GoogleFonts.poppins(
                        fontSize: priceFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
