import 'package:e_commerce/core/helper_functions/get_currency.dart';
import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';

import 'details.dart';

class Amount {
  String? total;
  String? currency;
  DetailsEntity? details;

  Amount({this.total, this.currency, this.details});

  Map<String, dynamic> toJson() => {
    'total': total,
    'currency': currency,
    'details': details?.toJson(),
  };

  factory Amount.fromEntity(OrderEntity order){
    return Amount(
      total: order.calculateTotalOrderPrice().toString(),
      currency: getCurrency(),
      details: DetailsEntity.fromEntity(order),
    );
  }
}
