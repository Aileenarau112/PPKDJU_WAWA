class Product {
  final int id;
  final String title;
  final double price;
  final String image;
  final String category;
  final double rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.category,
    required this.rating,
  });

  // JSON → Object Product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      image: json['image'],
      category: json['category'],
      rating: (json['rating']['rate'] as num).toDouble(),
    );
  }

  // Object Product → JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'image': image,
      'category': category,
      'rating': {
        'rate': rating,
      },
    };
  }
}