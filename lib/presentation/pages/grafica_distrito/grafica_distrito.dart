import 'package:fenix/presentation/pages/grafica_distrito/grafica_distrito_provider.dart';
import 'package:fenix/presentation/shared/drawer/drawer.dart';
import 'package:fenix/presentation/shared/sliver_app_bar/sliver_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/progress_indicator.dart';

class GraficaDistrito extends ConsumerWidget {
  const GraficaDistrito({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultados = ref.watch(resultadosDistritoProvider);

    return Scaffold(
      drawer: const CustomDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          const CustomSliverAppBar(
            text1: 'Distritos',
            sameLine: true,
            isPrimary: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              resultados.when(
                data: (data) {
                  if (data == null) {
                    return [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Error descargando resultados',
                          style: Theme.of(context).textTheme.labelSmall,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ];
                  }
                  if (data.isEmpty) {
                    return [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Sin resultados',
                          style: Theme.of(context).textTheme.labelSmall,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ];
                  }
                  return [const Placeholder()];
                },
                error: (error, stackTrace) => [const Text('Error.')],
                loading: () => [const MyProgressIndicator()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
