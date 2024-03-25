import 'package:flutter/services.dart';

const String appName = 'Fenix24';

const String errorVerificar = 'Verificar Errores';
const String errorCampoObligatorio = 'Campo obligatorio';


const String preg1Entorno = 'Factores y condiciones que propician las plagas:';
const String preg2Entorno = 'Áreas de oportunidad en instalaciones:';
const String preg3Entorno = 'Identificar posibles sectores de ingreso:';
const String preg4Entorno = 'Potenciales lugares de anidamiento y puntos críticos:';
const String preg5Entorno = 'Identificar fuentes de alimentación:';
const String preg6Entorno = 'Registro de hallazgos con evidencias encontradas:';

enum StatusPage { idle, loading, succes, error }

//const latLonCenter = LatLng(19.821392, -90.518809);
const zoomCenter = 13.0;

const noValue = 0;
const siValue = 1;

const tipoTurnoLocal = 1;
const tipoTurnoForaneo = 2;

const tipoServPlaga = 1;
const tipoServTanque = 2;
const tipoServDesin = 3;

final regExpMoney = FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}'));

const estadoId = 4;

final DateTime fechaIniApp = DateTime.now();
final DateTime fechaFinApp = DateTime.now().add(const Duration(days: 60));

final Uri urlAPK = Uri.parse('https://play.google.com/store/apps/details?id=com.app_soft.cam.f.ayun_cam');


const int permisoVerResultDistritos = 0;
