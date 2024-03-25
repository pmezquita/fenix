import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fenix/domain/entities/usuarios.dart';

final usuarioLoggedProvider = StateProvider<Usuario?>((ref) => null);

final checkPermisoUserProvider = Provider.family<bool, int>((ref, indexPermiso) {
  final usuarioLoggeado = ref.watch(usuarioLoggedProvider);
  return _checkPermisoUser(usuarioLoggeado?.tipoPermiso ?? '', indexPermiso);
});

bool _checkPermisoUser(String permisos, int indexPermiso) {
  // Linea para pruebas con permisos
  // if( indexPermiso == permisoCrearEditarOrden) return false;
  // if( indexPermiso == permisoCrearEditarRepresentantes) return true;

  final arrayPermisos = permisos.split(',');

  // Si no tiene suficientes claves el JSON recibido retorna falso
  if (indexPermiso >= arrayPermisos.length) return false;

  return int.tryParse(arrayPermisos[indexPermiso]) == 1 ? true : false;
}
