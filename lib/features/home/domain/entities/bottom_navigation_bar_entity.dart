import 'package:e_commerce/core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String activeImage, inActiveImage, name;

  BottomNavigationBarEntity({
    required this.activeImage,
    required this.inActiveImage,
    required this.name,
  });
}

List<BottomNavigationBarEntity> get getBottomNavigationBarItems => [
  BottomNavigationBarEntity(
    activeImage: Assets.imagesBoldHome,
    inActiveImage: Assets.imagesOutlinedHome,
    name: "الرئيسية",
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.imagesBoldProducts,
    inActiveImage: Assets.imagesOutlinedProducts,
    name: "المنتجات",
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.imagesBoldShoppingCart,
    inActiveImage: Assets.imagesOutlinedShoppingCart,
    name: "سلة التسوق",
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.imagesBoldUser,
    inActiveImage: Assets.imagesOutlinedUser,
    name: "حسابي",
  ),
];
