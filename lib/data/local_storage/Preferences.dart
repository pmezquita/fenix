import 'package:shared_preferences/shared_preferences.dart';

class Preferencias {
  static final Preferencias _instancia = Preferencias._internal();

  factory Preferencias() {
    return _instancia;
  }

  Preferencias._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Recordar
  bool get recordar {
    return _prefs.getBool('recordar') ?? false;
  }

  set recordar(bool value) {
    _prefs.setBool('recordar', value);
  }

  // Usuario
  String get username {
    return _prefs.getString('username') ?? '';
  }

  set username(String value) {
    _prefs.setString('username', value);
  }

  // Password
  String get password {
    return _prefs.getString('password') ?? '';
  }

  set password(String value) {
    _prefs.setString('password', value);
  }

  String get ultimoLogin {
    // Si no hay fecha válida regresa un año atrás
    return _prefs.getString('ultimoLogin') ?? DateTime.now().subtract(const Duration(days: 365)).toIso8601String();
  }

  set ultimoLogin(String value) {
    _prefs.setString('ultimoLogin', value);
  }

  set needLoginOnline(bool isNeeded) {
    _prefs.setBool('needLoginOnline', isNeeded);
  }

  bool get isNeededLoginOnline {
    return _prefs.getBool('needLoginOnline') ?? true;
  }

  void saveAll({required String username, required String password, required bool recordar}) {
    this.username = username;
    this.password = password;
    this.recordar = recordar;
    ultimoLogin = DateTime.now().toIso8601String();
  }
}
