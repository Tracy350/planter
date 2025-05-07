import 'package:flourish/features/shop/screens/plantdetails.dart';
import 'package:flourish/models/product_models.dart';
import 'package:flourish/models/shop_models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductSearchDelegate extends SearchDelegate<Product> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(
          context,
          Product(
            name: '',
            description: '',
            imageUrl: '',
            price: 0,
            category: '',
          )),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final shopProvider = Provider.of<Shop>(context);
    final results = shopProvider.products
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return _buildResultsList(results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final shopProvider = Provider.of<Shop>(context);
    final suggestions = shopProvider.products
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return _buildResultsList(suggestions);
  }

  Widget _buildResultsList(List<Product> products) {
    if (products.isEmpty) {
      return const Center(child: Text('No products found'));
    }

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];

        return GestureDetector(
          onTap: () {
            // Close the search and navigate to details
            close(context, product);
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
          child: ListTile(
            leading: Image.asset(product.imageUrl, width: 50, height: 50),
            title: Text(product.name),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
          ),
        );
      },
    );
  }
}
