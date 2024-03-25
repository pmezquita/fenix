import 'package:flutter/material.dart';

class MyProgressIndicator extends StatelessWidget {
  const MyProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 80.0,
          height: 80.0,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/gif/circular_progress.gif')))),
    );
  }
}
