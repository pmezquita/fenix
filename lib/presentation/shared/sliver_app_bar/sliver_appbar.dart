import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fenix/core/theme/main_theme.dart';
import 'package:fenix/presentation/providers/usuario_logged_provider.dart';
import 'package:fenix/presentation/shared/sliver_app_bar/fondo.dart';

class CustomSliverAppBar extends ConsumerWidget {
  final bool isPrimary;
  final String text1;
  final String? text2;
  final bool sameLine;

  const CustomSliverAppBar({Key? key, this.isPrimary = true, this.sameLine = true, required this.text1, this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usuarioLogged = ref.watch(usuarioLoggedProvider);
    return SliverAppBar(
      backgroundColor: isPrimary ? primaryDark : secondaryDark,
      foregroundColor: Colors.white,
      expandedHeight: 100.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Transform(
            transform: Matrix4.translationValues(-45, 0.0, 0.0),
            child: SafeArea(
              child: sameLine
                  ? Wrap(alignment: WrapAlignment.center, children: content(context))
                  : Column(mainAxisAlignment: MainAxisAlignment.end, children: content(context)),
            ),
          ),
          background: Fondo.appBar(
              isPrimary: isPrimary, text1: usuarioLogged?.fullname ?? '', text2: usuarioLogged?.username ?? '')),
    );
  }

  List<Widget> content(BuildContext context) {
    return [
      Text(text1, style: Theme.of(context).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.bold)),
      (text2 != null)
          ? Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(text2!, style: Theme.of(context).textTheme.displayMedium))
          : const SizedBox.shrink(),
    ];
  }
}
