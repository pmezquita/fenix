import 'package:fenix/data/apis/api_fenix.dart';
import 'package:fenix/domain/models/result_api_grafica_distritos.dart';
import 'package:fenix/helpers/constants.dart';
import 'package:fenix/presentation/providers/usuario_logged_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'grafica_distrito_provider.g.dart';

@riverpod
class ResultadosDistrito extends _$ResultadosDistrito {
  @override
  FutureOr<List<ResultGraficaDistritos>?> build() async {
    final usarPersonasMC = ref.read(checkPermisoUserProvider(permisoUsarPersonaMC));
    return await ApiFenix.getResultGraficaDistritos(usarPersonasMC);
  }

  Future<void> reload() async {
    final usarPersonasMC = ref.read(checkPermisoUserProvider(permisoUsarPersonaMC));
    state = AsyncValue.data(await ApiFenix.getResultGraficaDistritos(usarPersonasMC));
  }
}