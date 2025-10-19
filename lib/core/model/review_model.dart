
import 'package:e_commerce/core/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final String review;
  final String date;
  final num rate;

  ReviewModel({
    required this.name,
    required this.image,
    required this.review,
    required this.date,
    required this.rate,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'],
      image: json['image'],
      review: json['review'],
      date: json['date'],
      rate: json['rate'],
    );
  }

  factory ReviewModel.fromReviewEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
      name: reviewEntity.name,
      image: reviewEntity.image,
      review: reviewEntity.review,
      date: reviewEntity.date,
      rate: reviewEntity.rate,
    );
  }

  ReviewEntity toEntity() {
    return ReviewEntity(
      name: name,
      image: image,
      review: review,
      date: date,
      rate: rate,
    );
  }
  toJson(){
    return {
      'name': name,
      'image': image,
      'review': review,
      'date': date,
      'rate': rate,
    };
  }
}
