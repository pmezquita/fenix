import 'package:flutter/services.dart';

const String appName = 'Fenix Gráfico';

const String errorVerificar = 'Verificar Errores';
const String errorCampoObligatorio = 'Campo obligatorio';

enum StatusPage { idle, loading, succes, error }

const noValue = 0;
const siValue = 1;

final regExpMoney = FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}'));

final Uri urlAPK = Uri.parse('https://play.google.com/store/apps/details?id=com.app_soft.cam.f.ayun_cam');


const int permisoVerGraficaDistritos = 0;
const int permisoUsarPersonaMC = 2;
