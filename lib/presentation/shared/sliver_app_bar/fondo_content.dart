import 'package:flutter/material.dart';

import '../../../core/theme/main_theme.dart';

class FondoContent extends StatelessWidget {
  final String text1, text2;

  const FondoContent({Key? key, required this.text1, required this.text2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconSize = MediaQuery.of(context).size.height * .04;
    return SafeArea(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      alignment: Alignment.topCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  text1,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                Text(
                  text2,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: iconSize,
            backgroundColor: primary,
            backgroundImage: const AssetImage("assets/img/app_icon.png"),
          )
        ],
      ),
    ));
  }
}
