List<Usuario> usuariosFromMap(List<dynamic> mapList) => List<Usuario>.from(mapList.map((x) => Usuario.fromJson(x)));

class Usuario {
  int? id;
  int? usuarioid;
  String? username;
  String? password;
  String? fullname;
  int? estatus;
  String? tipoPermiso;
  String? permiso;
  String? token;

  Usuario({
    this.id,
    this.usuarioid,
    this.username,
    this.password,
    this.fullname,
    this.estatus,
    this.tipoPermiso,
    this.permiso,
    this.token,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        usuarioid: json["id"],
        username: json["username"],
        password: json["password"],
        fullname: json["fullname"],
        estatus: json["estatus"],
        tipoPermiso: json["tipo_Permiso"],
        permiso: json["permiso"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "usuarioid": usuarioid,
        "username": username,
        "password": password,
        "fullname": fullname,
        "estatus": estatus,
        "tipo_Permiso": tipoPermiso,
        "permiso": permiso,
        "token": token,
      };
}
