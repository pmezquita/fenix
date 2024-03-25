import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:fenix/helpers/constants.dart';

import '../../../providers/is_obsolete_version_provider.dart';
import '../../../shared/alertdialog_error.dart';
import '../../../shared/button_principal.dart';
import '../login_provider.dart';
import 'dialog_obsolete_version.dart';

class ButtonIngresar extends ConsumerWidget {
  const ButtonIngresar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginEvents = ref.read(formLoginProvider.notifier);
    final isLoading = ref.watch(statusPageLoginProvider) == StatusPage.loading;

    return ReactiveFormConsumer(
      builder: (context, form, child) => Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 25.0, top: 10.0),
        child: SizedBox(
          width: double.infinity,
          height: 64.0,
          child: ButtonPrincipal(
              text: 'INGRESAR',
              onPressed: isLoading
                  ? null
                  : () async {
                      form.unfocus();
                      if (form.invalid) return form.markAllAsTouched();

                      if (await ref.read(isObsoleteVersionProvider.future)) {
                        if (context.mounted) {
                          showDialog<String>(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) => const DialogObsoleteVersion());
                        }
                        return;
                      }
                      final error = await loginEvents.ingresar();

                      if (context.mounted) {
                        if (error.isEmpty) {
                          context.goNamed('home');
                        } else {
                          showDialog<String>(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) => AlertDialogError(msg: error));
                        }
                      }
                    }),
        ),
      ),
    );
  }
}
