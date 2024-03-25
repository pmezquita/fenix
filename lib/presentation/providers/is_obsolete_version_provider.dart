import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../data/apis/api_fenix.dart';

final isObsoleteVersionProvider = FutureProvider<bool>((ref) async {
  final platformInfo = await PackageInfo.fromPlatform();
  final versionServer = await ApiFenix.getVersionApp();
  final versionApp = int.tryParse(platformInfo.buildNumber) ?? 0;
  return versionApp < versionServer;
});
