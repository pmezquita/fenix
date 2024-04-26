import 'package:flutter/material.dart';

class ContainerRow extends StatelessWidget {
  final Widget left, right;

  const ContainerRow({
    super.key,
    required this.left,
    required this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: left),
        const SizedBox(width: 10.0),
        Expanded(child: right),
      ],
    );
  }
}
