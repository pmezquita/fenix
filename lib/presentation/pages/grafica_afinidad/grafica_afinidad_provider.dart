import 'package:fenix/data/apis/api_fenix.dart';
import 'package:fenix/domain/models/result_api_grafica_afinidad.dart';
import 'package:fenix/helpers/constants.dart';
import 'package:fenix/presentation/providers/usuario_logged_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'grafica_afinidad_provider.g.dart';

@riverpod
class DistritoSelected extends _$DistritoSelected {
  @override
  int build() {
    return 0;
  }

  void set(int distrito) {
    state = distrito;
  }
}

@riverpod
class ResultadosAfinidad extends _$ResultadosAfinidad {
  @override
  FutureOr<ResultGraficaAfinidad?> build() async {
    final usarPersonasMC = ref.read(checkPermisoUserProvider(permisoUsarPersonaMC));
    final distrito = ref.watch(distritoSelectedProvider);
    return await ApiFenix.getResultGraficaAfinidad(usarPersonasMC: usarPersonasMC, distrito: distrito);
  }

  Future<void> reload() async {
    final usarPersonasMC = ref.read(checkPermisoUserProvider(permisoUsarPersonaMC));
    final distrito = ref.watch(distritoSelectedProvider);

    state = AsyncValue.data(await ApiFenix.getResultGraficaAfinidad(
      usarPersonasMC: usarPersonasMC,
      distrito: distrito,
    ));
  }
}
