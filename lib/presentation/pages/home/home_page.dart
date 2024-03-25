import 'package:flutter/material.dart';
import 'package:fenix/core/theme/main_theme.dart';
import 'package:fenix/presentation/shared/drawer/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primary,
          centerTitle: true,
          elevation: 0.0,
        ),
        drawer: const CustomDrawer(),
        body: Container(
          decoration: const BoxDecoration(
            color: secondary,
          ),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: SafeArea(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: const AssetImage("assets/img/app_icon.png"),
                            width: viewportConstraints.maxWidth / 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
