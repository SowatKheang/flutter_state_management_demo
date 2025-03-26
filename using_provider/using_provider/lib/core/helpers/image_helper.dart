
import 'package:flutter/material.dart';

///
/// [ImageHelper]
///
class ImageHelper {

  static Widget buildImageWidget(String imageUrl, {double? width, double? height}) {
    return Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: BoxFit.contain,
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