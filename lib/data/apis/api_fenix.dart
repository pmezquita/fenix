import 'package:dio/dio.dart';
import 'package:fenix/domain/entities/usuarios.dart';
import 'package:fenix/domain/entities/versiones_model.dart';
import 'package:fenix/domain/models/result_api_grafica_afinidad.dart';
import 'package:fenix/domain/models/result_api_grafica_distritos.dart';
import 'package:fenix/domain/models/result_api_validate_token_user.dart';
import 'package:flutter/foundation.dart';

class ApiFenix {
  static const String _apiScheme = "http";

  // pruebas
  // static const String _apiHost = "srvregerseafi.municipiocampeche.gob.mx";
  // Producción
  static const String _apiHost = "sysfenix24.ddns.net";
  static const int _apiPort = 3873;
  static const String _prefix = "/APP/";
  static const baseUrl = '$_apiScheme://$_apiHost:$_apiPort$_prefix';
  static const apiKey = '5z1W5ZHuyw1BuQIG395n2wN0IHmXCI89fCP8CnEyEmnoheKkMv';

  static Future<ResultApiValidateTokenUser?> validateUser(Usuario? usuario) async {
    if (usuario == null) return null;

    const endpoint = 'GetUser_ValidateToken';
    final queryParams = {
      'apiKey': apiKey,
      'usuario': usuario.username,
      'password': usuario.password,
      'token': usuario.token,
    };
    final dio = Dio();

    try {
      final response = await dio.get('$baseUrl$endpoint', queryParameters: queryParams);
      return ResultApiValidateTokenUser(response.data);
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      return null;
    }
  }

  static Future<int> getVersionApp() async {
    const endpoint = 'GetVersion_ServiFumi';
    final dio = Dio();

    try {
      final response = await dio.get('$baseUrl$endpoint');
      final versionResult = versionesFromMap(response.data).first;
      return versionResult.versionInt ?? 0;
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      return 0;
    }
  }

  static Future<List<Usuario>?> getUsuario(String user, String pass) async {
    const endpoint = 'GetUser';
    final queryParams = {
      'apiKey': apiKey,
      'usuario': user,
      'password': pass,
    };
    final dio = Dio();

    try {
      final response = await dio.get('$baseUrl$endpoint', queryParameters: queryParams);
      return usuariosFromMap(response.data);
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      return null;
    }
  }

  static Future<List<ResultGraficaDistritos>?> getResultGraficaDistritos(bool usarPersonasMC) async {
    return usarPersonasMC ? _getResultGraficaDistritosMC() : _getResultGraficaDistritos();
  }

  static Future<List<ResultGraficaDistritos>?> _getResultGraficaDistritos() async {
    const endpoint = 'Get_Graficos_Distritos';
    final queryParams = {
      'apiKey': apiKey,
    };
    final dio = Dio();

    try {
      final response = await dio.get('$baseUrl$endpoint', queryParameters: queryParams);
      return resultGraficaDistritosFromMap(response.data);
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      return null;
    }
  }

  static Future<List<ResultGraficaDistritos>?> _getResultGraficaDistritosMC() async {
    const endpoint = 'Get_Graficos_Distritos_MC';
    final queryParams = {
      'apiKey': apiKey,
    };
    final dio = Dio();

    try {
      final response = await dio.get('$baseUrl$endpoint', queryParameters: queryParams);
      return resultGraficaDistritosFromMap(response.data);
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      return null;
    }
  }

  static Future<ResultGraficaAfinidad?> getResultGraficaAfinidad({
    required bool usarPersonasMC,
    required int distrito,
  }) async {
    return usarPersonasMC ? _getResultGraficaAfinidadMC(distrito) : _getResultGraficaAfinidad(distrito);
  }

  static Future<ResultGraficaAfinidad?> _getResultGraficaAfinidad(int distrito) async {
    const endpoint = 'Get_Graficos_Distrito_Afinidad';
    final queryParams = {
      'apiKey': apiKey,
      'distrito': distrito,
    };
    final dio = Dio();

    try {
      final response = await dio.get('$baseUrl$endpoint', queryParameters: queryParams);
      return resultGraficaAfinidadFromMap(response.data).firstOrNull;
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      return null;
    }
  }

  static Future<ResultGraficaAfinidad?> _getResultGraficaAfinidadMC(int distrito) async {
    const endpoint = 'Get_Graficos_Afinidad_Distrito_MC';
    final queryParams = {
      'apiKey': apiKey,
      'distrito': distrito,
    };
    final dio = Dio();

    try {
      final response = await dio.get('$baseUrl$endpoint', queryParameters: queryParams);
      return resultGraficaAfinidadFromMap(response.data).firstOrNull;
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      return null;
    }
  }
}
