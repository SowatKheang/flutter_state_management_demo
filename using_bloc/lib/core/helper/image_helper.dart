
import 'package:flutter/material.dart';

///
/// [ImageHelper]
///
class ImageHelper {

  static Widget buildImageWidget(
    String imageUrl, 
    {
      double? width, 
      double? height,
      int? cacheWidth,
      int? cacheHeight,
    }) {
    return Image.network(
      imageUrl,
      width: width,
      height: height,
      cacheHeight: cacheHeight,
      cacheWidth: cacheWidth,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Image.network(
          'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
          fit: BoxFit.contain,
          width: width,
          height: height,
        );
      },
    );
  }

}