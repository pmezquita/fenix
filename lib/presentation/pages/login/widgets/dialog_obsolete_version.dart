import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../helpers/utils.dart';

class DialogObsoleteVersion extends StatelessWidget {
  const DialogObsoleteVersion({super.key});

  @override
  Widget build(BuildContext context) {
    String content = 'Necesita solicitar a informática la nueva versión del app';
    VoidCallback fun = () => exit(0);

    if (Theme.of(context).platform == TargetPlatform.android) {
      content = 'Descargue e instale la nueva versión';
      fun = () {
        descargarApk();
      };
    }

    return AlertDialog(
      title: const Text("VERSIÓN OBSOLETA", textAlign: TextAlign.center, style: TextStyle(color: Colors.red)),
      content: Text(content, textAlign: TextAlign.center),
      actions: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: ElevatedButton(
              onPressed: fun,
              child: const Text("Aceptar"),
            )),
          ],
        ),
      ],
    );
  }
}
