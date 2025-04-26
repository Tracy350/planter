import 'package:flourish/cart/widgets/cart_container.dart';
import 'package:flourish/home/widget/custombuttonoutlined.dart';
import 'package:flourish/widgets/customappbar.dart';
import 'package:flourish/widgets/customfooter.dart';
import 'package:flourish/widgets/customheader.dart';
import 'package:flourish/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600; // Check if screen width is below 600px

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Customheader(
              currentpage: 'Cart',
              pagepath: 'Home > Cart',
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: isMobile
                  ? Column(
                      children: [
                        _buildCartItems(),
                        // const SizedBox(height: 10),
                        _buildCartTotal(context),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              _buildCartItems(),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(flex: 1, child: _buildCartTotal(context)),
                      ],
                    ),
            ),

            // Footer
            SafeArea(child: CustomFooter()),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItems() {
    return ListView(
      shrinkWrap: true, // Ensures it takes only the needed space
      physics:
          const NeverScrollableScrollPhysics(), // Prevents nested scrolling
      padding: const EdgeInsets.all(16),
      children: const [
        CartContainer(
          imageUrl: "assets/plant1.jpg",
          name: "Stylish Sneakers",
          price: 49.99,
          rating: 4.5,
          reviews: 120,
        ),
        CartContainer(
          imageUrl: "assets/plant1.jpg",
          name: "Casual Jacket",
          price: 79.99,
          rating: 4.8,
          reviews: 200,
        ),
      ],
    );
  }

  Widget _buildCartTotal(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cart Total',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Total Items: 2',
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Total Price: \$129.98',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Custombuttonoutlined(
            height: 50,
            width: double.infinity, // Makes button full width in column mode
            text: 'CheckOut',
            onTap: () {
              Navigator.pushNamed(
                  context, '/checkout'); // Ensure the route exists
            },
          ),
        ],
      ),
    );
  }
}
