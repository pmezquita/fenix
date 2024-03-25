import 'package:fenix/presentation/pages/grafica_distrito/grafica_distrito_provider.dart';
import 'package:fenix/presentation/pages/grafica_distrito/widgets/grafico.dart';
import 'package:fenix/presentation/pages/grafica_distrito/widgets/msg.dart';
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
                  if (data == null) return [const Msg(msg: 'Error descargando resultados')];
                  if (data.isEmpty) return [const Msg(msg: 'Sin resultados')];

                  return [
                    Grafico(data),
                  ];
                },
                error: (error, stackTrace) => [Msg(msg: error.toString())],
                loading: () => [const MyProgressIndicator()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
