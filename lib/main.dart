import 'package:fenix/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/app_router.dart';
import 'core/theme/main_theme.dart';
import 'data/local_storage/Preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = Preferencias();
  await prefs.initPrefs();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(systemNavigationBarColor: primaryDark));
    final appRouter = ref.watch(appRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: AppTheme().theme(),
      routerConfig: appRouter,
    );
  }
}
