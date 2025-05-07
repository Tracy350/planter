import 'package:flourish/models/product_models.dart';
import 'package:flourish/models/shop_models.dart';
import 'package:flourish/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final Function onTap;
  const ProductTile({super.key, required this.product, required this.onTap});

  void addToCart(BuildContext context) {
    context.read<Shop>().addToCart(product);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double imageHeight = constraints.maxWidth < 600 ? double.infinity : 250;
        double imageWidth = constraints.maxWidth < 600 ? double.infinity : 140;
        double nameFontSize = constraints.maxWidth < 600 ? 14 : 16;
        double categoryFontSize = constraints.maxWidth < 600 ? 12 : 14;
        double priceFontSize = constraints.maxWidth < 600 ? 14 : 16;

        return GestureDetector(
          onTap: () {
            onTap();
          },
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  product.imageUrl,
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
                        product.name,
                        style: GoogleFonts.poppins(
                          fontSize: nameFontSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        product.category,
                        style: GoogleFonts.poppins(
                          fontSize: categoryFontSize,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.price.toStringAsFixed(2),
                            style: GoogleFonts.poppins(
                              fontSize: priceFontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: IconButton(
                              onPressed: () => addToCart(context),
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ),
                        ],
                      )
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
