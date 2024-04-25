import 'package:fenix/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:fenix/core/theme/main_theme.dart';
import 'package:fenix/presentation/shared/drawer/drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/usuario_logged_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usarPersonasMC = ref.read(checkPermisoUserProvider(permisoUsarPersonaMC));

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text( usarPersonasMC ? 'MC' : 'CC'),
          backgroundColor: primary,
          centerTitle: true,
          elevation: 0.0,
        ),
        drawer: const CustomDrawer(),
        body: Container(
          decoration: const BoxDecoration(
            color: secondary,
          ),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: SafeArea(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: const AssetImage("assets/img/app_icon.png"),
                            width: viewportConstraints.maxWidth / 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
