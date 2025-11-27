
import 'package:e_commerce/core/entities/review_entity.dart';


class ProductEntity {
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
  final List<ReviewEntity> reviews;

  ProductEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.isFeatured,
    this.imageUrl,
    required this.expirationDuration,
    this.isOrganic = false,
    required this.numberOfCalories,
    required this.unitAmount,
    this.ratingCount = 0,
    this.avgRating = 0,
    required this.reviews,
  });
}
