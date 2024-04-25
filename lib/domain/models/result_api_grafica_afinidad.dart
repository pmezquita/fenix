import 'grafico_afinidad_data_source.dart';

List<ResultGraficaAfinidad> resultGraficaAfinidadFromMap(List<dynamic> mapList) =>
    List<ResultGraficaAfinidad>.from(mapList.map((x) => ResultGraficaAfinidad.fromJson(x)));

class ResultGraficaAfinidad {
  String distrito;
  int afinAlcaldes;
  int afinDiputados;
  int afinPresidentes;
  int afinSenadores;
  int todos;

  ResultGraficaAfinidad({
    required this.distrito,
    required this.afinAlcaldes,
    required this.afinDiputados,
    required this.afinPresidentes,
    required this.afinSenadores,
    required this.todos,
  });

  factory ResultGraficaAfinidad.fromJson(Map<String, dynamic> json) => ResultGraficaAfinidad(
        distrito: json["distrito"],
        afinAlcaldes: json["afin_alcaldes"],
        afinDiputados: json["afin_diputados"],
        afinPresidentes: json["afin_presidentes"],
        afinSenadores: json["afin_senadores"],
        todos: json["todos"],
      );

  Map<String, dynamic> toJson() => {
        "distrito": distrito,
        "afin_alcaldes": afinAlcaldes,
        "afin_diputados": afinDiputados,
        "afin_presidentes": afinPresidentes,
        "afin_senadores": afinSenadores,
        "todos": todos,
      };

  List<GraficoAfinidadDataSource> toDataSource() {
    return [
      GraficoAfinidadDataSource(label: "Diputado", actual: afinDiputados, estimado: todos),
      GraficoAfinidadDataSource(label: "Alcalde", actual: afinAlcaldes, estimado: todos),
      GraficoAfinidadDataSource(label: "Senador", actual: afinSenadores, estimado: todos),
      GraficoAfinidadDataSource(label: "Presidente", actual: afinPresidentes, estimado: todos),
    ];
  }
}
