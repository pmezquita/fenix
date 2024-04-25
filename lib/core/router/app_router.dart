import 'package:fenix/presentation/pages/grafica_afinidad/grafica_afinidad.dart';
import 'package:fenix/presentation/pages/grafica_distrito/grafica_distrito.dart';
import 'package:fenix/presentation/pages/home/home_page.dart';
import 'package:fenix/presentation/pages/login/login_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final appRouterProvider = Provider<GoRouter>((ref) => GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: 'login',
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/home',
          name: 'home',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/grafica-distritos',
          name: 'graficaDistritos',
          builder: (context, state) => const GraficaDistrito(),
        ),
        GoRoute(
          path: '/grafica-afinidad',
          name: 'graficaAfinidad',
          builder: (context, state) => const GraficaAfinidad(),
        ),
      ],
    ));
