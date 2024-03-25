import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:fenix/data/local_storage/Preferences.dart';
import 'package:fenix/domain/usecases/usecase_login.dart';
import 'package:fenix/helpers/Security.dart';
import 'package:fenix/presentation/providers/usuario_logged_provider.dart';

import '../../../helpers/constants.dart';

final formLoginProvider = StateNotifierProvider.autoDispose<LoginNotifier, FormGroup>((ref) => LoginNotifier(ref));
final obscurePassLoginProvider = StateProvider.autoDispose<bool>((ref) => true);
final statusPageLoginProvider = StateProvider.autoDispose<StatusPage>((ref) => StatusPage.idle);

class LoginNotifier extends StateNotifier<FormGroup> {
  final StateNotifierProviderRef<LoginNotifier, FormGroup> ref;

  final prefs = Preferencias();

  // Si se recordaron las credenciales, se usan los valores de las preferencias al crear el formulario
  LoginNotifier(this.ref) : super(FormGroup({})) {
    state = FormGroup({
      'username': FormControl<String>(
        value: prefs.recordar ? prefs.username : '',
        validators: [Validators.required],
      ),
      'password': FormControl<String>(
        value: prefs.recordar ? prefs.password : '',
        validators: [Validators.required],
      ),
      'recordar': FormControl<bool>(value: prefs.recordar),
    });
  }

  Future<String> ingresar() async {
    final statusPage = ref.read(statusPageLoginProvider.notifier);
    final String username = state.control('username').value.toString().trim();
    final String password = state.control('password').value.toString().trim();
    final passEncrypt = Security.encryptSHA256(password);
    final bool recordar = state.control('recordar').value;

    statusPage.update((state) => StatusPage.loading);

    final resultLogin = await UsecaseLogin.loginOnline(
      user: username,
      pass: passEncrypt,
    );

    if (resultLogin.error.isNotEmpty) {
      statusPage.update((state) => StatusPage.error);
      return resultLogin.error;
    }

    // Se almacena el usuario logeado en el Provider
    ref.read(usuarioLoggedProvider.notifier).state = resultLogin.usuario;

    // Se guardan las preferencias de las credenciales y del recordar
    Preferencias().saveAll(username: username, password: password, recordar: recordar);

    statusPage.update((state) => StatusPage.succes);
    return '';
  }
}
