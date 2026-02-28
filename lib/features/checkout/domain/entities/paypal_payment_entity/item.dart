import 'package:e_commerce/core/helper_functions/get_currency.dart';
import 'package:e_commerce/features/home/domain/entities/cart_item_entity.dart';

class Item {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  Item({this.name, this.quantity, this.price, this.currency});

  Map<String, dynamic> toJson() => {
    'name': name,
    'quantity': quantity,
    'price': price,
    'currency': currency,
  };

  factory Item.fromEntity(CartItemEntity entity) {
    return Item(
      name: entity.productEntity.name,
      quantity: entity.quantity,
      price: entity.productEntity.price.toString(),
      currency: getCurrency(),
    );
  }
}
