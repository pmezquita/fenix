import 'package:flutter/material.dart';

class AlertDialogError extends StatelessWidget {
  final String msg;

  const AlertDialogError({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(msg, textAlign: TextAlign.center, style: const TextStyle(color: Colors.red)),

      actions: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Aceptar'))),
          ],
        ),
      ],
    );
  }
}
