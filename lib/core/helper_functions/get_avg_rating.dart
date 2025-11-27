import 'package:e_commerce/core/entities/review_entity.dart';

num getAvgRating(List<ReviewEntity> reviews) {
  var sum = 0.0;
  for (var review in reviews) {
    sum += review.rate;
  }
  return sum / reviews.length;
}
