part of 'cart_item_cubit.dart';

sealed class CartItemState {}

final class CartItemInitial extends CartItemState {}

final class CartItemUpdated extends CartItemState {
  final CartItemEntity cartItemEntity;

  CartItemUpdated({required this.cartItemEntity});
}
