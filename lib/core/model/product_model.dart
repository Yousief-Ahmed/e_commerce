
import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/helper_functions/get_avg_rating.dart';
import 'package:e_commerce/core/model/review_model.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final bool isFeatured;
  String? imageUrl;
  final int expirationDuration;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final num ratingCount;
  final num avgRating;
  final List<ReviewModel> reviews;
  final num sellingCount;
  ProductModel({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.isFeatured,
    this.imageUrl,
    required this.expirationDuration,
    required this.isOrganic,
    required this.numberOfCalories,
    required this.unitAmount,
    this.ratingCount = 0,
    this.avgRating = 0,
    required this.reviews,
    required this.sellingCount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      code: json['code'],
      description: json['description'],
      price: json['price'],
      isFeatured: json['isFeatured'],
      imageUrl: json['imageUrl'],
      expirationDuration: json['expirationDate'],
      isOrganic: json['isOrganic'],
      numberOfCalories: json['numberOfCalories'],
      unitAmount: json['unitAmount'],
      ratingCount: json['ratingCount'] ?? 0,
      avgRating: getAvgRating(
        (json['reviews'] as List)
            .map((e) => ReviewModel.fromJson(e).toEntity())
            .toList(),
      ),
      reviews: (json['reviews'] as List)
          .map((e) => ReviewModel.fromJson(e))
          .toList(),
      sellingCount: json['sellingCount'] ?? 0,
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      code: code,
      description: description,
      price: price,
      isFeatured: isFeatured,
      isOrganic: isOrganic,
      imageUrl: imageUrl,
      expirationDuration: expirationDuration,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      reviews: reviews.map((e) => e.toEntity()).toList(),
      ratingCount: ratingCount,
      avgRating: avgRating,
    );
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationDate': expirationDuration,
      'isOrganic': isOrganic,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'ratingCount': ratingCount,
      'avgRating': avgRating,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
