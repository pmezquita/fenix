import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fenix/presentation/pages/login/login_provider.dart';
import 'package:fenix/presentation/pages/login/widgets/button_ingresar.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../core/theme/main_theme.dart';
import '../../../helpers/constants.dart';
import '../../shared/label_version.dart';
import '../../shared/sliver_app_bar/fondo.dart';
import '../../shared/status_page_process.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formLogin = ref.watch(formLoginProvider);
    final isObscurePass = ref.watch(obscurePassLoginProvider);
    final statusPage = ref.watch(statusPageLoginProvider);

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: ReactiveForm(
            formGroup: formLogin,
            child: Column(
              children: <Widget>[
                const Fondo.login(height: 200),
                Text(appName, style: Theme.of(context).textTheme.displayLarge),
                const VersionLabel(),
                const SizedBox(height: 20.0),
                Padding(
                  padding: myPaddingForm,
                  child: Column(
                    children: [
                      ReactiveTextField(
                        formControlName: 'username',
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(prefixIcon: Icon(Icons.person), labelText: 'Usuario'),
                        validationMessages: {
                          'required': (error) => errorCampoObligatorio,
                        },
                        showErrors: (control) => control.invalid && control.touched,
                      ),
                      const SizedBox(height: 20),
                      ReactiveTextField(
                        formControlName: 'password',
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        obscureText: isObscurePass,
                        decoration: InputDecoration(
                            labelText: 'Contraseña',
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                                onPressed: () => ref.read(obscurePassLoginProvider.notifier).update((state) => !state),
                                icon: Icon(isObscurePass ? Icons.visibility_outlined : Icons.visibility_off_outlined))),
                        validationMessages: {
                          'required': (error) => errorCampoObligatorio,
                        },
                        showErrors: (control) => control.invalid && control.touched,
                      ),
                      FractionallySizedBox(
                        widthFactor: 0.6,
                        child: ReactiveSwitchListTile(
                          formControlName: 'recordar',
                          title: const Text('¿Recordar?'),
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(child: SizedBox.shrink()),
                StatusPageProcess(statusPage: statusPage),
                const ButtonIngresar(),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
