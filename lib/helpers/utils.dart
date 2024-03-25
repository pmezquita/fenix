import 'package:fenix/core/theme/main_theme.dart';
import 'package:fenix/presentation/shared/alertdialog_2_option.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import 'constants.dart';

Future<void> launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw 'Could not launch $url';
  }
}

Future<void> launchCall(String phoneNumber) async {
  final uri = Uri(scheme: 'tel', path: phoneNumber);
  if (!await launchUrl(uri)) {
    throw 'Could not launch call $phoneNumber';
  }
}

Future<void> descargarApk() async {
  await launchInBrowser(urlAPK);
}

double convertColorToHue(Color color) {
  return HSLColor.fromColor(color).hue;
}

void showSnackBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg),
      backgroundColor: primaryDark,
    ),
  );
}

Future<bool?> showDialogEditando(BuildContext context) {
  return showDialog<bool?>(
    context: context,
    builder: (context) => AlertDialog2Opt(
      title: 'Editando Registro',
      content: '¿Desea salir sin guardar cambios?',
      textOptSi: 'Salir',
      onPressedOptNo: () {
        context.pop();
      },
      onPressedOptSi: () {
        context.pop();
        context.pop();
      },
    ),
  );
}

void goLoginReset(BuildContext context) {
  while (context.canPop()) {
    context.pop();
  }
  context.goNamed('login');
}

double checkDouble(dynamic value) {
  if (value is String) {
    return double.parse(value);
  } else {
    return value.toDouble();
  }
}
