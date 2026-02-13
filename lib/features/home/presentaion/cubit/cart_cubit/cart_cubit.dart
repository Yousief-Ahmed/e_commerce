import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/features/home/domain/entities/cart_entity.dart';
import 'package:e_commerce/features/home/domain/entities/cart_item_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity(cartItems: []);

  void addProduct(ProductEntity product) {
    bool isProductExist = cartEntity.isExist(product);
    CartItemEntity cartItem = cartEntity.getCartItem(product);
    if (isProductExist) {
      cartItem.increaseItemCount();
    } else {
      cartEntity.addCartItem(cartItem);
    }
    emit(CartItemAdded());
  }

  void removeProduct(ProductEntity product) {
    CartItemEntity cartItem = cartEntity.getCartItem(product);
    cartEntity.removeCartItem(cartItem);
    emit(CartItemRemoved());
  }
}
