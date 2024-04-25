import 'package:fenix/helpers/constants.dart';
import 'package:fenix/presentation/pages/grafica_afinidad/grafica_afinidad_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Filtro extends ConsumerWidget {
  const Filtro({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final distritoEvent = ref.read(distritoSelectedProvider.notifier);
    final distrito = ref.watch(distritoSelectedProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: Column(
        children: [
          const Text('Distrito:'),
          DropdownButton(
            isExpanded: true,
            value: distrito,
            items: distritos
                .map((e) => e == 0
                    ? const DropdownMenuItem(
                        value: 0,
                        child: Text('Selecciona...'),
                      )
                    : DropdownMenuItem(
                        alignment: AlignmentDirectional.center,
                        value: e,
                        child: Text(e.toString()),
                      ))
                .toList(growable: false),
            onChanged: (int? value) => distritoEvent.set(value ?? 0),
          ),
        ],
      ),
    );
  }
}
