List<Versiones> versionesFromMap(List<dynamic> mapList) =>
    List<Versiones>.from(mapList.map((x) => Versiones.fromJson(x)));

class Versiones {
  int? versionid;
  int? versionInt;

  Versiones({
    this.versionid,
    this.versionInt,
  });

  factory Versiones.fromJson(Map<String, dynamic> json) => Versiones(
    versionid: json["versionid"],
    versionInt: json["versionInt"],
  );

  Map<String, dynamic> toJson() => {
    "versionid": versionid,
    "versionInt": versionInt,
  };
}
