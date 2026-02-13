import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
  });

  final String imageUrl;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (_, __) => SizedBox(),
      errorWidget: (_, __, ___) => SizedBox(),
      memCacheWidth: 300,
      memCacheHeight: 300,
      width: width,
      height: height,
      fit: BoxFit.contain,
    );
  }
}
