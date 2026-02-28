import 'package:e_commerce/features/home/domain/entities/cart_item_entity.dart';

import 'item.dart';

class ItemList {
  List<Item>? items;

  ItemList({this.items});

  Map<String, dynamic> toJson() => {
    'items': items?.map((e) => e.toJson()).toList(),
  };

  factory ItemList.fromEntity(List<CartItemEntity> cartItem) {
    return ItemList(
      items: cartItem.map((e) => Item.fromEntity(e)).toList(),
    );
  }
}
