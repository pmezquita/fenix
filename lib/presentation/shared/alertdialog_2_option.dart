import 'package:flutter/material.dart';

import '../../core/theme/main_theme.dart';

class AlertDialog2Opt extends StatelessWidget {
  final String title;
  final String content;
  final String textOptSi;
  final String textOptNo;
  final VoidCallback? onPressedOptNo;
  final VoidCallback? onPressedOptSi;

  const AlertDialog2Opt({
    super.key,
    required this.title,
    required this.content,
    this.textOptSi = 'Sí',
    this.textOptNo = 'No',
    this.onPressedOptNo,
    this.onPressedOptSi,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, textAlign: TextAlign.center),
      content: Text(content, textAlign: TextAlign.center),
      actions: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: ElevatedButton(
              onPressed: onPressedOptNo,
              style: ElevatedButton.styleFrom(
                foregroundColor: primaryExtraLight,
                backgroundColor: secondaryLight,
                side: const BorderSide(color: secondary),
              ),
              child: Text(textOptNo),
            )),
            const SizedBox(width: 30.0),
            Expanded(child: ElevatedButton(onPressed: onPressedOptSi, child: Text(textOptSi))),
          ],
        ),
      ],
    );
  }
}
