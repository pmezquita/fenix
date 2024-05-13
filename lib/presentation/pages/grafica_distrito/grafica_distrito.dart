import 'package:fenix/presentation/pages/grafica_distrito/grafica_distrito_provider.dart';
import 'package:fenix/presentation/pages/grafica_distrito/widgets/grafico.dart';
import 'package:fenix/presentation/shared/msg.dart';
import 'package:fenix/presentation/shared/drawer/drawer.dart';
import 'package:fenix/presentation/shared/sized_box_height.dart';
import 'package:fenix/presentation/shared/sliver_app_bar/sliver_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../shared/progress_indicator.dart';

class GraficaDistrito extends ConsumerWidget {
  const GraficaDistrito({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultados = ref.watch(resultadosDistritoProvider);
    final event = ref.read(resultadosDistritoProvider.notifier);
    final formatter = NumberFormat.currency(locale: 'en_US', symbol: '', decimalDigits: 0);

    return Scaffold(
      drawer: const CustomDrawer(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () => event.reload(),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          const CustomSliverAppBar(
            text1: 'Entrevistados',
            sameLine: true,
            isPrimary: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              resultados.when(
                data: (data) {
                  if (data == null) return [const Msg(msg: 'Error descargando resultados')];
                  if (data.isEmpty) return [const Msg(msg: 'Sin resultados')];

                  int ttl = 0;
                  for (final item in data) {
                    ttl += item.existente ?? 0;
                  }

                  return [
                    Grafico(data),
                    const SizedBoxHeight(),
                    Center(
                      child: Text(
                        'Total: ${formatter.format(ttl)}',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
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
