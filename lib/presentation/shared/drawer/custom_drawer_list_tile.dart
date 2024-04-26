import 'package:flutter/material.dart';

import '../../../core/theme/main_theme.dart';

class CustomListTile extends StatelessWidget {
  final Function()? onTap;
  final Widget icon;
  final String title;

  const CustomListTile({super.key, this.onTap, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleTextStyle: Theme.of(context).textTheme.labelSmall?.copyWith(color: secondaryDark),
      iconColor: primaryDark,
      leading: icon,
      title:Text(title),
      onTap: onTap,
    );
  }
}
