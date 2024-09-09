import 'package:store_app/models/rating_model.dart';

class ProductModel {
  final String title, description, price, image, category;
  final int id;
  final RatingModel rating;
  ProductModel({
    required this.category,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.id,
    required this.rating,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      category: json['category'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
      id: json['id'],
      rating: RatingModel.fromJson(json['rating']),
    );
  }
}
