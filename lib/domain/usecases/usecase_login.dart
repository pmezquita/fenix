import 'package:fenix/data/apis/api_fenix.dart';
import 'package:fenix/domain/models/result_login.dart';

class UsecaseLogin {
  static Future<ResultLogin> loginOnline({required String user, required String pass}) async {
    try {
      final usuarios = await ApiFenix.getUsuario(user, pass);

      if (usuarios == null) return ResultLogin('Es obligatorio ingresar con acceso a internet', null);
      if (usuarios.isEmpty) return ResultLogin('Usuario y/o contraseña incorrectos', null);

      final usuario = usuarios.first;

      if (usuario.estatus == 0) return ResultLogin('Usuario dado de baja, verificar con administración', null);

      return ResultLogin('', usuario);
    } on Exception {
      return ResultLogin('Error en la descarga de usuarios', null);
    }
  }

// static Future<ResultLoginLocal> loginLocal(String user, String pass) async {
//   try {
//     final UsuarioService usuarioDB = UsuarioService();
//
//     final usuario = await usuarioDB.getUsuarioValido(user, pass);
//
//     if (usuario == null || usuario.usuarioid == 0) {
//       return ResultLoginLocal('Usuario y/o contraseña incorrectos', null);
//     }
//
//     if (usuario.estatus == 0) {
//       await IsarService().clearFullDB();
//       return ResultLoginLocal('Usuario dado de baja, verificar con administración', null);
//     }
//
//     return ResultLoginLocal('', usuario);
//   } on Exception {
//     return ResultLoginLocal('Usuario dado de baja, verificar con administración', null);
//   }
// }
}
