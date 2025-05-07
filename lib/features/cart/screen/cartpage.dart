import 'package:flourish/features/cart/widgets/cart_container.dart';
import 'package:flourish/features/home/widget/custombuttonoutlined.dart';
import 'package:flourish/models/shop_models.dart';
import 'package:flourish/widgets/customappbar.dart';
import 'package:flourish/widgets/customfooter.dart';
import 'package:flourish/widgets/customheader.dart';
import 'package:flourish/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600; // Check if screen width is below 600px
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Customheader(
              currentpage: 'Cart',
              pagepath: 'Home > Cart',
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: isMobile
                  ? Column(
                      children: [
                        _buildCartItems(context),
                        // const SizedBox(height: 10),
                        if (cart.isNotEmpty) _buildCartTotal(context),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              _buildCartItems(context),
                            ],
                          ),
                        ),
                        if (cart.isNotEmpty) ...[
                          const SizedBox(width: 16),
                          Expanded(flex: 1, child: _buildCartTotal(context)),
                        ],
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

  Widget _buildCartItems(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600; // Check if screen width is below 600px
    if (cart.isEmpty) {
      return Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/empty.png',
                scale: isMobile ? 1.5 : 2.5, // Increased scale = smaller image
              ),
              const SizedBox(height: 16),
              Text(
                'Your cart is empty',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ));
    }
    return ListView.builder(
        itemCount: cart.length,
        shrinkWrap: true, // Ensures it takes only the needed space
        physics:
            const NeverScrollableScrollPhysics(), // Prevents nested scrolling
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          //get individual item from cart
          final item = cart[index];

          //return cart tile
          return CartContainer(
            product: item,
            imageUrl: item.imageUrl,
            name: item.name,
            price: item.price,
            rating: double.tryParse(item.rating ?? '0') ??
                0.0, // or item.rating!.toDouble()
            reviews: item.reviews ?? 0, // or item.reviews!
          );
        });
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
