import 'package:flutter/material.dart';

class ContainerRow extends StatelessWidget {
  final Widget left, right;

  const ContainerRow({
    Key? key,
    required this.left,
    required this.right,
  }) : super(key: key);

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
