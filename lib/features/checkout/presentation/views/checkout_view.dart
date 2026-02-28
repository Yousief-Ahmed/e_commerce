import 'package:e_commerce/core/helper_functions/get_user.dart';
import 'package:e_commerce/core/repo/orders_repo/orders_repo.dart';
import 'package:e_commerce/core/services/getit_service.dart';
import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce/features/checkout/domain/entities/shipping_info_entity.dart';
import 'package:e_commerce/features/checkout/presentation/manager/cubit/add_order/add_order_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/add_order_cubit_bloc_builder.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:e_commerce/features/home/domain/entities/cart_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartEntity});
  static const String routeName = 'checkoutView';
  final CartEntity cartEntity;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late OrderEntity orderEntity;
  @override
  void initState() {
    super.initState();
    orderEntity = OrderEntity(
      uId: getUser().uid,
      cartEntity: widget.cartEntity,
      shippingInfo: ShippingInfoEntity(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(getIt<OrdersRepo>()),
      child: Scaffold(
        body: Provider.value(
          value: orderEntity,
          child: const AddOrderCubitBlocBuilder(child: CheckoutViewBody()),
        ),
      ),
    );
  }
}
