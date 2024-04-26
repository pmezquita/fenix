import 'package:flutter/material.dart';
import 'package:fenix/helpers/constants.dart';
import 'package:fenix/presentation/shared/label_version.dart';

import '../../core/theme/main_theme.dart';

class AlertDialogAbout extends StatelessWidget {
  const AlertDialogAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      title: const Row(
        children: <Widget>[
          Icon(
            Icons.info,
            color: primaryDark,
          ),
          SizedBox(width: 5.0),
          Text(appName, style: TextStyle(color: secondaryDark, fontWeight: FontWeight.bold, fontSize: 20)),
        ],
      ),
      content: SizedBox(
        height: 200,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: VersionLabel(),
            ),
            Image.asset("assets/img/app_icon.png", width: 150.0, height: 150.0),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text("Aceptar"),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
