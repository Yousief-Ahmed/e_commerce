import 'package:e_commerce/core/entities/product_entity.dart';

class CartItemEntity {
  final ProductEntity productEntity;
  int quantity;

  CartItemEntity({required this.productEntity, this.quantity = 0});

  num calculateTotalPrice() {
    return productEntity.price * quantity;
  }

  num calculateTotalWeight() {
    return productEntity.unitAmount * quantity;
  }

  increaseItemQuantity() {
    quantity++;
  }

  decreaseItemQuantity() {
    if (quantity > 0) quantity--;
  }
}
