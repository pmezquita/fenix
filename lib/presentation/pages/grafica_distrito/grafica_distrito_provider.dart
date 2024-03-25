import 'package:fenix/data/apis/api_fenix.dart';
import 'package:fenix/domain/models/result_api_grafica_distritos.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'grafica_distrito_provider.g.dart';

@riverpod
class ResultadosDistrito extends _$ResultadosDistrito {
  @override
  FutureOr<List<ResultGraficaDistritos>?> build() async {
    return await ApiFenix.getResultGraficaDistritos();
  }

  Future<void> reload() async {
    state = AsyncValue.data(await ApiFenix.getResultGraficaDistritos());
  }
}