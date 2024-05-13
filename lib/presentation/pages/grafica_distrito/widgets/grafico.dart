import 'package:fenix/core/theme/main_theme.dart';
import 'package:fenix/domain/models/result_api_grafica_distritos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Grafico extends ConsumerWidget {
  final List<ResultGraficaDistritos> data;

  const Grafico(this.data, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SfCartesianChart(
        primaryXAxis: const CategoryAxis(title: AxisTitle(text: 'Distritos')),
        primaryYAxis: const NumericAxis(minimum: 0),
        tooltipBehavior: TooltipBehavior(enable: true),
        legend: const Legend(isVisible: true),
        series: <CartesianSeries<ResultGraficaDistritos, String>>[
          // Renders column chart
          BarSeries<ResultGraficaDistritos, String>(
              color: primaryLight,
              name: 'Actual',
              dataLabelMapper: (ResultGraficaDistritos data, _) => data.existente.toString(),
              dataLabelSettings: const DataLabelSettings(isVisible: true),
              dataSource: data,
              xValueMapper: (ResultGraficaDistritos data, _) => data.distrito,
              yValueMapper: (ResultGraficaDistritos data, _) => data.existente),
          BarSeries<ResultGraficaDistritos, String>(
              color: secondary,
              name: 'Estimado',
              dataLabelMapper: (ResultGraficaDistritos data, _) => data.esperado.toString(),
              dataLabelSettings: const DataLabelSettings(isVisible: true),
              dataSource: data,
              xValueMapper: (ResultGraficaDistritos data, _) => data.distrito,
              yValueMapper: (ResultGraficaDistritos data, _) => data.esperado),
        ]);
  }
}
