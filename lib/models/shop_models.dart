import 'package:flourish/models/product_models.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  //products for sale
  final List<Product> shopproducts = [
    Product(
      name: 'Monstera Deliciosa',
      description: 'Description of Product 1',
      imageUrl: 'assets/plant1.jpg',
      price: 19.99,
      category: 'Indoor',
    ),
    Product(
      name: 'Fiddle Leaf Fig',
      description: 'Description of Product 1',
      imageUrl: 'assets/plant2.jpg',
      price: 19.99,
      category: 'Indoor',
    ),
    Product(
      name: 'Snake Plant',
      description: 'Description of Product 1',
      imageUrl: 'assets/plant1.jpg',
      price: 19.99,
      category: 'Indoor',
    ),
    Product(
      name: 'Spider Plant',
      description: 'Description of Product 1',
      imageUrl: 'assets/plant1.jpg',
      price: 19.99,
      category: 'Indoor',
    ),
    Product(
      name: 'Monstera Deliciosa',
      description: 'Description of Product 1',
      imageUrl: 'assets/plant2.jpg',
      price: 19.99,
      category: 'Indoor',
    ),
    Product(
      name: 'Monstera Deliciosa',
      description: 'Description of Product 1',
      imageUrl: 'assets/plant1.jpg',
      price: 19.99,
      category: 'Indoor',
    ),
    Product(
      name: 'Monstera Deliciosa',
      description: 'Description of Product 1',
      imageUrl: 'assets/plant2.jpg',
      price: 19.99,
      category: 'Indoor',
    ),
    Product(
      name: 'Monstera Deliciosa',
      description: 'Description of Product 1',
      imageUrl: 'assets/plant1.jpg',
      price: 19.99,
      category: 'Indoor',
    ),
    Product(
      name: 'Monstera Deliciosa',
      description: 'Description of Product 1',
      imageUrl: 'assets/plant2.jpg',
      price: 19.99,
      category: 'Indoor',
    ),
    Product(
      name: 'Monstera Deliciosa',
      description: 'Description of Product 1',
      imageUrl: 'assets/plant3.jpg',
      price: 19.99,
      category: 'Indoor',
    ),
    Product(
      name: 'Monstera Deliciosa',
      description: 'Description of Product 1',
      imageUrl: 'assets/plant4.jpg',
      price: 19.99,
      category: 'Indoor',
    ),
  ];

  //user cart

  final List<Product> userCart = [];

  //get product list
  List<Product> get products => shopproducts;

  //get user cart
  List<Product> get cart => userCart;

  //add itmto cart
  void addToCart(Product product) {
    userCart.add(product);
    notifyListeners();

 
  }
     //remove item from cart
    void removeFromCart(Product product) {
      userCart.remove(product);
      notifyListeners();
    }
}
