import 'package:flourish/features/shop/screens/plantdetails.dart';
import 'package:flourish/features/shop/widgets/product_tile.dart';
import 'package:flourish/models/shop_models.dart';
import 'package:flourish/widgets/customappbar.dart';
import 'package:flourish/widgets/customfooter.dart';
import 'package:flourish/widgets/customheader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Shoppage extends StatefulWidget {
  const Shoppage({super.key});

  @override
  State<Shoppage> createState() => _ShoppageState();
}

class _ShoppageState extends State<Shoppage> {
  //
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final isMobile = currentWidth > 600;
    final products = context.watch<Shop>().shopproducts;
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Customheader(
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
                  final product = products[index];
                  return ProductTile(
                    product: product,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlantDetailsPage(
                            product: product,
                            image: product.imageUrl,
                            name: product.name,
                            category: product.category,
                            price: product.price.toString(),
                          ),
                        ),
                      );
                    },
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
}
