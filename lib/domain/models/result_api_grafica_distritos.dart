List<ResultGraficaDistritos> resultGraficaDistritosFromMap(List<dynamic> mapList) =>
    List<ResultGraficaDistritos>.from(mapList.map((x) => ResultGraficaDistritos.fromJson(x)));

class ResultGraficaDistritos {
  int? id;
  String? distrito;
  int? esperado;
  int? existente;

  ResultGraficaDistritos({
    this.id,
    this.distrito,
    this.esperado,
    this.existente,
  });

  factory ResultGraficaDistritos.fromJson(Map<String, dynamic> json) => ResultGraficaDistritos(
        id: json["id"],
        distrito: json["distrito"],
        esperado: json["esperado"],
        existente: json["existente"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "distrito": distrito,
        "esperado": esperado,
        "existente": existente,
      };
}
