import 'package:fenix/presentation/pages/grafica_afinidad/grafica_afinidad_provider.dart';
import 'package:fenix/presentation/pages/grafica_afinidad/widgets/filtro.dart';
import 'package:fenix/presentation/pages/grafica_afinidad/widgets/grafico.dart';
import 'package:fenix/presentation/shared/drawer/drawer.dart';
import 'package:fenix/presentation/shared/msg.dart';
import 'package:fenix/presentation/shared/sliver_app_bar/sliver_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/progress_indicator.dart';

class GraficaAfinidad extends ConsumerWidget {
  const GraficaAfinidad({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultados = ref.watch(resultadosAfinidadProvider);
    final event = ref.read(resultadosAfinidadProvider.notifier);

    final content = resultados.when(
      data: (data) {
        if (data == null) return const Msg(msg: 'Error descargando resultados');

        return Grafico(data);
      },
      error: (error, stackTrace) => Msg(msg: error.toString()),
      loading: () => const MyProgressIndicator(),
    );

    return Scaffold(
      drawer: const CustomDrawer(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () => event.reload(),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          const CustomSliverAppBar(
            text1: 'Afinidades',
            sameLine: true,
            isPrimary: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Filtro(),
                content,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
