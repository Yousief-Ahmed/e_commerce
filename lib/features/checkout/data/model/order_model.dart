import 'package:e_commerce/features/checkout/data/model/order_product_model.dart';
import 'package:e_commerce/features/checkout/data/model/shipping_info_model.dart';
import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingInfoModel shippingInfoModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;

  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.shippingInfoModel,
    required this.orderProducts,
    required this.paymentMethod,
  });

  factory OrderModel.fromEntity(OrderEntity orderEntity) {
    return OrderModel(
      totalPrice: orderEntity.cartEntity.calculateTotalCartPrice().toDouble(),
      uId: orderEntity.uId,
      shippingInfoModel: ShippingInfoModel.fromEntity(orderEntity.shippingInfo),
      orderProducts: orderEntity.cartEntity.cartItems
          .map((e) => OrderProductModel.fromEntity(cartItemEntity: e))
          .toList(),
      paymentMethod: orderEntity.payWithCash == true ? "Cash" : "Paypal",
    );
  }

  toJson() {
    return {
      "totalPrice": totalPrice,
      "uId": uId,
      "status": "pending",
      "date": DateTime.now().toString(),
      "shippingInfoModel": shippingInfoModel.toJson(),
      "orderProducts": orderProducts.map((e) => e.toJson()).toList(),
      "paymentMethod": paymentMethod,
    };
  }
}
