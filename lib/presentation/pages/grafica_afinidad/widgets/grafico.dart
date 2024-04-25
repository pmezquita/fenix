import 'package:fenix/core/theme/main_theme.dart';
import 'package:fenix/domain/models/grafico_afinidad_data_source.dart';
import 'package:fenix/domain/models/result_api_grafica_afinidad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Grafico extends ConsumerWidget {
  final ResultGraficaAfinidad data;

  const Grafico(this.data, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataSource = data.toDataSource();
    
    return SfCartesianChart(
        primaryXAxis: const CategoryAxis(title: AxisTitle(text: 'Candidatura')),
        primaryYAxis: const NumericAxis(),
        tooltipBehavior: TooltipBehavior(enable: true),
        legend: const Legend(isVisible: true),
        series: <CartesianSeries<GraficoAfinidadDataSource, String>>[
          // Renders column chart
          BarSeries<GraficoAfinidadDataSource, String>(
              color: primaryLight,
              name: 'Actual',
              dataLabelMapper: (GraficoAfinidadDataSource data, _) => data.actual.toString(),
              dataLabelSettings: const DataLabelSettings(isVisible: true),
              dataSource: dataSource,
              xValueMapper: (GraficoAfinidadDataSource data, _) => data.label,
              yValueMapper: (GraficoAfinidadDataSource data, _) => data.actual),
          BarSeries<GraficoAfinidadDataSource, String>(
              color: secondary,
              name: 'Estimado',
              dataLabelMapper: (GraficoAfinidadDataSource data, _) => data.estimado.toString(),
              dataLabelSettings: const DataLabelSettings(isVisible: true),
              dataSource: dataSource,
              xValueMapper: (GraficoAfinidadDataSource data, _) => data.label,
              yValueMapper: (GraficoAfinidadDataSource data, _) => data.estimado),
        ]);
  }
}
