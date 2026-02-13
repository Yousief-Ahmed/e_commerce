import 'package:e_commerce/features/checkout/domain/entities/shipping_info_entity.dart';
import 'package:e_commerce/features/home/domain/entities/cart_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  ShippingInfoEntity shippingInfo;
  bool? payWithCash;

  OrderEntity({
    required this.cartEntity,
    required this.shippingInfo,
    this.payWithCash,
  });
}
