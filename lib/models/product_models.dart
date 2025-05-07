class Product {
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final String category;
  final String? rating;
  final int? reviews;
  final int quantityAvailable;

  Product({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.category,
    this.quantityAvailable = 0,
    this.rating,
    this.reviews,
  });
}
