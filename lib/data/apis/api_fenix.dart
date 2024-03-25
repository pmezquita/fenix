import 'package:dio/dio.dart';
import 'package:fenix/domain/entities/usuarios.dart';
import 'package:fenix/domain/entities/versiones_model.dart';
import 'package:fenix/domain/models/result_api_grafica_distritos.dart';
import 'package:fenix/domain/models/result_api_validate_token_user.dart';
import 'package:flutter/foundation.dart';

class ApiFenix {
  static const String _apiScheme = "http";

  // pruebas
  // static const String _apiHost = "srvregerseafi.municipiocampeche.gob.mx";
  // Producción
  static const String _apiHost = "82.165.208.180";
  static const int _apiPort = 8074;
  static const String _prefix = "/APP/";
  static const baseUrl = '$_apiScheme://$_apiHost:$_apiPort$_prefix';
  static const apiKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9';
  // 5z1W5ZHuyw1BuQIG395n2wN0IHmXCI89fCP8CnEyEmnoheKkMv

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

  static Future<List<ResultGraficaDistritos>?> getResultGraficaDistritos() async {
    return [
      ResultGraficaDistritos(id: 1, distrito: '1', esperado: 100, existente: 100),
      ResultGraficaDistritos(id: 2, distrito: '2', esperado: 100, existente: 60),
      ResultGraficaDistritos(id: 3, distrito: '3', esperado: 100, existente: 70),
      ResultGraficaDistritos(id: 4, distrito: '4', esperado: 100, existente: 30),
      ResultGraficaDistritos(id: 5, distrito: '5', esperado: 100, existente: 90),
      ResultGraficaDistritos(id: 6, distrito: '6', esperado: 100, existente: 20),
      ResultGraficaDistritos(id: 7, distrito: '7', esperado: 100, existente: 80),
    ];

    // const endpoint = 'GetGraficaDistritos';
    // final queryParams = {
    //   'apiKey': apiKey,
    // };
    // final dio = Dio();
    //
    // try {
    //   final response = await dio.get('$baseUrl$endpoint', queryParameters: queryParams);
    //   return resultGraficaDistritosFromMap(response.data);
    // } on DioException catch (e) {
    //   if (kDebugMode) {
    //     print(e.message);
    //   }
    //   return null;
    // }
  }
}