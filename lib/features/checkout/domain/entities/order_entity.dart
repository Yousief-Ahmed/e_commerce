import 'package:e_commerce/features/checkout/domain/entities/shipping_info_entity.dart';
import 'package:e_commerce/features/home/domain/entities/cart_entity.dart';

class OrderEntity {
  final String uId;
  final CartEntity cartEntity;
  ShippingInfoEntity shippingInfo;
  bool? payWithCash;

  OrderEntity({
    required this.uId,
    required this.cartEntity,
    required this.shippingInfo,
    this.payWithCash,
  });

  double calculateShippingCost() {
    return 30;
  }

  double calculateOrderDiscount() {
    return 0;
  }

  double calculateTotalOrderPrice() {
    return cartEntity.calculateTotalCartPrice() +
        calculateShippingCost() -
        calculateOrderDiscount();
  }

 

}
