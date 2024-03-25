import 'dart:ui';

import 'package:flutter/material.dart';

class TextBlur extends StatelessWidget {
  const TextBlur({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: const Text('########################'),
    );
  }
}
