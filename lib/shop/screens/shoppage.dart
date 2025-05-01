import 'package:flourish/shop/screens/plantdetails.dart';
import 'package:flourish/widgets/customappbar.dart';
import 'package:flourish/widgets/customfooter.dart';
import 'package:flourish/widgets/customheader.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Shoppage extends StatefulWidget {
  const Shoppage({super.key});

  @override
  State<Shoppage> createState() => _ShoppageState();
}

class _ShoppageState extends State<Shoppage> {
  List<Map<String, String>> products = [
    {
      'image': 'assets/plant1.jpg',
      'name': 'Monstera Deliciosa',
      'category': 'Indoor',
      'price': '\$120'
    },
    {
      'image': 'assets/plant2.jpg',
      'name': 'Fiddle Leaf Fig',
      'category': 'Outdoor',
      'price': '\$200'
    },
    {
      'image': 'assets/plant3.jpg',
      'name': 'Snake Plant',
      'category': 'Acquatic',
      'price': '\$1500'
    },
    {
      'image': 'assets/plant4.jpg',
      'name': 'Spider Plant',
      'category': 'Indoor',
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

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final isMobile = currentWidth > 600;
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Customheader(
              currentpage: 'Shop',
              pagepath: 'Home > Shop',
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isMobile ? 4 : 2,
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
            CustomFooter()
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(
    String image,
    String name,
    String category,
    String price,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double imageHeight = constraints.maxWidth < 600 ? double.infinity : 250;
        double imageWidth = constraints.maxWidth < 600 ? double.infinity : 140;
        double nameFontSize = constraints.maxWidth < 600 ? 14 : 16;
        double categoryFontSize = constraints.maxWidth < 600 ? 12 : 14;
        double priceFontSize = constraints.maxWidth < 600 ? 14 : 16;

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PlantDetailsPage(
                  image: image,
                  name: name,
                  category: category,
                  price: price,
                ),
              ),
            );
          },
          child: Stack(
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
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
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
          ),
        );
      },
    );
  }
}
