import 'package:e_commerce/core/helper_functions/build_app_bar.dart';
import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce/features/checkout/domain/entities/shipping_info_entity.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:e_commerce/features/home/domain/entities/cart_entity.dart';
import 'package:e_commerce/features/home/domain/entities/cart_item_entity.dart';
import 'package:e_commerce/features/home/presentaion/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartEntity});
  static const String routeName = 'checkoutView';
  final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.value(
        value: OrderEntity(
          cartEntity: cartEntity,
          shippingInfo: ShippingInfoEntity(),
        ),
        child: CheckoutViewBody(),
      ),
    );
  }
}
