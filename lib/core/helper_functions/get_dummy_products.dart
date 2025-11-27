import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/entities/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    name: 'Apple',
    description: 'Fresh and juicy apples.',
    price: 1.99,
    imageUrl: transparentPlaceholder,
    isOrganic: true,
    isFeatured: true,
    expirationDuration: 7,
    numberOfCalories: 100,
    unitAmount: 1,
    code: 'APL123',

    reviews: [],
  );
}

List<ProductEntity> getDummyProducts(int count) {
  return List.generate(count, (index) => getDummyProduct());
}
