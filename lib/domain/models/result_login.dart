import '../entities/usuarios.dart';

class ResultLogin {
  String error = '';
  Usuario? usuario;

  ResultLogin(this.error, this.usuario);
}