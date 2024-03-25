import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fenix/core/theme/main_theme.dart';

class Apartado extends ConsumerWidget {
  final int? numApartado;
  final IconData? iconData;
  final String title;
  final String? subtitle;
  final List<Widget> children;
  final bool hasError;
  final bool initiallyExpanded;

  const Apartado({
    Key? key,
    required this.title,
    required this.children,
    this.numApartado,
    this.iconData,
    this.subtitle,
    this.hasError = false,
    this.initiallyExpanded = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        maintainState: true,
        expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
        initiallyExpanded: initiallyExpanded,
        collapsedBackgroundColor: primaryExtraLight,
        childrenPadding: const EdgeInsets.all(10.0),
        shape: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)), borderSide: BorderSide(color: secondaryLight)),
        leading: Icon(iconData, size: 30.0),
        trailing: hasError ? const Icon(Icons.error, color: error) : null,
        title: Text(title, style: Theme.of(context).textTheme.labelSmall),
        subtitle: subtitle != null ? Text(subtitle!, style: Theme.of(context).textTheme.bodyMedium) : null,
        children: children,
      ),
    );
  }
}
