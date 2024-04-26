import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fenix/helpers/constants.dart';
import 'package:fenix/presentation/shared/progress_indicator.dart';

import '../../core/theme/main_theme.dart';

class StatusPageProcess extends ConsumerWidget {
  final StatusPage statusPage;

  const StatusPageProcess({required this.statusPage, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const size = 50.0;
    switch (statusPage) {
      case StatusPage.loading:
        return const MyProgressIndicator();

      case StatusPage.succes:
        return const Icon(
          Icons.check_circle_outline,
          color: success,
          size: size,
        );

      case StatusPage.error:
        return const Icon(
          Icons.error_outline,
          color: error,
          size: size,
        );

      default:
        return const SizedBox.shrink();
    }
  }
}
