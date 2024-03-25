import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAnimatedSwitcher extends ConsumerWidget {
  final Widget child;
  final String childKey;
  final bool show;

  const CustomAnimatedSwitcher({
    required this.child,
    required this.childKey,
    this.show = false,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      transitionBuilder: (Widget child, Animation<double> animation) => ScaleTransition(scale: animation, child: child),
      child: show
          ? Container(key: ValueKey<String>('show$childKey'), child: child)
          : Container(key: ValueKey<String>('hide$childKey')),
    );
  }
}
