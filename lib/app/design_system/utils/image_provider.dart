import 'package:flutter/material.dart';

class TImageProvider {
  static ImageProvider get(String imagePath) {
    if (imagePath.startsWith('assets/')) {
      return AssetImage(imagePath);
    }
    return NetworkImage(imagePath);
  }
}
