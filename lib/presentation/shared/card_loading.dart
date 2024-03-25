import 'package:flutter/material.dart';
import 'package:fenix/presentation/shared/sized_box_height.dart';

import 'text_blur.dart';

class CardLoading extends StatelessWidget {
  const CardLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
        child: ListTile(
            title: TextBlur(),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextBlur(),
                TextBlur(),
                TextBlur(),
                TextBlur(),
                SizedBoxHeight(),
                TextBlur(),
                TextBlur(),
                TextBlur(),
                TextBlur(),
              ],
            )));
  }
}
