import 'package:flutter/material.dart';
import 'package:fenix/core/theme/main_theme.dart';

class ButtonPrincipal extends StatelessWidget {
  final String text;
  final bool isPrimary;
  final IconData? icon;
  final VoidCallback? onPressed;

  const ButtonPrincipal({
    super.key,
    required this.text,
    this.isPrimary = true,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: isPrimary
          ? Theme.of(context).elevatedButtonTheme.style
          : ElevatedButton.styleFrom(backgroundColor: secondary),
      label: Text(text),
      icon: (icon != null) ? Icon(icon) : const SizedBox.shrink(),
    );
  }
}
