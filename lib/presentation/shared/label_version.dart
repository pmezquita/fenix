import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionLabel extends StatelessWidget {
  const VersionLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: PackageInfo.fromPlatform(),
        builder: (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
          if (snapshot.hasData) {
            final version = snapshot.data!.version;
            return Text('v.$version');
          } else if (snapshot.hasError) {
            return const SizedBox.shrink();
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
