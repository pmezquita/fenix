import 'package:flutter/material.dart';
import 'package:fenix/core/theme/main_theme.dart';
import 'package:fenix/presentation/shared/sliver_app_bar/fondo_content.dart';
import 'package:fenix/presentation/shared/sliver_app_bar/wave_clipper_invert.dart';

import 'wave_clipper.dart';

class Fondo extends StatelessWidget {
  final Color color1, color2, color3;
  final String text1, text2;
  final double maxHeight;

  const Fondo._base(
      {Key? key,
      required this.color1,
      required this.color2,
      required this.color3,
      required this.maxHeight,
      this.text1 = '',
      this.text2 = ''})
      : super(key: key);

  const Fondo.login({
    Key? key,
    required double height,
  }) : this._base(color1: primaryDark, color2: primary, color3: primaryLight, maxHeight: height, key: key);

  const Fondo.appBar({Key? key, isPrimary = true, text1 = '', text2 = ''})
      : this._base(
            color1: isPrimary ? primaryDark : secondaryDark,
            color2: isPrimary ? primary : secondary,
            color3: isPrimary ? primaryDark : secondaryDark,
            maxHeight: 200,
            key: key,
            text1: text1,
            text2: text2);

  const Fondo.drawer({Key? key, isPrimary = true, text1 = '', text2 = ''})
      : this._base(
            color1: isPrimary ? primaryDark : secondaryDark,
            color2: isPrimary ? primary : secondary,
            color3: isPrimary ? primaryLight : secondaryLight,
            maxHeight: 150,
            key: key,
            text1: text1,
            text2: text2);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //stack overlaps widgets
        ClipPath(
          //upper clippath with less height
          clipper: WaveClipperInvert(),
          child: Container(
            color: color3,
            height: maxHeight,
          ),
        ),

        ClipPath(
          //upper clippath with less height
          clipper: WaveClipper(),
          child: Container(
            color: color2,
            height: maxHeight - maxHeight / 3.5,
          ),
        ),
        ClipPath(
          //upper clippath with less height
          clipper: WaveClipperInvert(),
          child: Container(
            color: color1,
            height: maxHeight - maxHeight / 2,
          ),
        ),
        FondoContent(text1: text1, text2: text2),
      ],
    );
  }
}
