import 'package:fenix/core/theme/main_theme.dart';
import 'package:fenix/helpers/constants.dart';
import 'package:fenix/presentation/providers/usuario_logged_provider.dart';
import 'package:fenix/presentation/shared/alertdialog_about.dart';
import 'package:fenix/presentation/shared/drawer/custom_drawer_list_tile.dart';
import 'package:fenix/presentation/shared/sliver_app_bar/fondo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../helpers/utils.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usuarioLogged = ref.watch(usuarioLoggedProvider);
    return Drawer(
      child: Container(
        color: primaryExtraLight,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Fondo.drawer(text1: usuarioLogged?.fullname ?? '', text2: usuarioLogged?.username ?? ''),
            CustomListTile(
              icon: const Icon(Icons.home),
              title: 'Inicio',
              onTap: () {
                context.replaceNamed('home');
                context.pushNamed('home');
              },
            ),
            ref.read(checkPermisoUserProvider(permisoVerGraficaDistritos))
                ? CustomListTile(
                    icon: const Icon(Icons.bar_chart),
                    title: 'Distritos',
                    onTap: () {
                      context.replaceNamed('home');
                      context.pushNamed('graficaDistritos');
                    },
                  )
                : const SizedBox.shrink(),
            CustomListTile(
              icon: const Icon(Icons.info),
              title: 'Acerca de...',
              onTap: () {
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext dialogContext) => const AlertDialogAbout());
              },
            ),
            Align(
                alignment: FractionalOffset.bottomCenter,
                child: Column(
                  children: <Widget>[
                    const Divider(),
                    CustomListTile(
                      icon: const Icon(Icons.directions_run),
                      title: 'Cerrar Sesion',
                      onTap: () {
                        goLoginReset(context);
                      },
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
