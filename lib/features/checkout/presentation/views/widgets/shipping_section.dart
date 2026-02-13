import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/shipping_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection>
    with AutomaticKeepAliveClientMixin {
  int selectedItem = -1;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    var orderEntity = context.read<OrderEntity>();
    return Column(
      children: [
        const SizedBox(height: 8),
        ShippingItem(
          onTap: () {
            setState(() {
              selectedItem = 0;
              orderEntity.payWithCash = true;
            });
          },
          title: 'الدفع عند الاستلام',
          subtitle: 'الدفع نقداً عند استلام الطلب من المندوب',
          price: (orderEntity.cartEntity.calculateTotalCartPrice() + 40)
              .toString(),
          isSelected: selectedItem == 0,
        ),
        const SizedBox(height: 8),
        ShippingItem(
          onTap: () {
            setState(() {
              selectedItem = 1;
              orderEntity.payWithCash = false;
            });
          },
          title: 'الدفع عبر وسائل الدفع',
          subtitle: 'الدفع باستخدام بطاقة الائتمان أو الخصم الخاصة بك',
          price: orderEntity.cartEntity.calculateTotalCartPrice().toString(),
          isSelected: selectedItem == 1,
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
