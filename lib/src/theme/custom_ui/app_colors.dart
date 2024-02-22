import 'package:flutter/material.dart';

class AppsColor {
  static const int _primaryGreen = 0xFF16A75C;
  MaterialColor primaryGreen = const MaterialColor(_primaryGreen, {
    50: Color(0xFFe8f6ef),
    100: Color(0xFFd0edde),
    200: Color(0xFFa2dcbe),
    300: Color(0xFF73ca9d),
    400: Color(0xFF45b97d),
    500: Color(_primaryGreen),
    600: Color(0xFF12864a),
    700: Color(0xFF0d6437),
    800: Color(0xFF094325),
    900: Color(0xFF042112),
  });

  static const int _primaryYellow = 0xFFFFD026;
  MaterialColor primaryYellow = const MaterialColor(_primaryYellow, {
    100: Color(0xFFfff6d4),
    200: Color(0xFFffeca8),
    300: Color(0xFFffe37d),
    400: Color(0xFFffd951),
    500: Color(_primaryYellow),
    600: Color(0xFFcca61e),
    700: Color(0xFF997d17),
    800: Color(0xFF66530f),
    900: Color(0xFF332a08),
  });

  static const int _primaryBlue = 0xFF1E88E5;
  MaterialColor primaryBlue = const MaterialColor(_primaryBlue, {
    100: Color(0xFFd2e7fa),
    200: Color(0xFFa5cff5),
    300: Color(0xFF78b8ef),
    400: Color(0xFF4ba0ea),
    500: Color(_primaryBlue),
    600: Color(0xFF186db7),
    700: Color(0xFF125289),
    800: Color(0xFF0c365c),
    900: Color(0xFF061b2e),
  });

  static const int _success = 0xFF1B8718;
  MaterialColor sucess = const MaterialColor(_success, {
    100: Color(0xFFDEF9D0),
    200: Color(0xFFBAF3A4),
    300: Color(0xFF83DB6D),
    400: Color(0xFF51B747),
    500: Color(_success),
    600: Color(0xFF117419),
    700: Color(0xFF0B6118),
    800: Color(0xFF084E18),
    900: Color(0xFF044118),
  });

  static const int _warning = 0xFFB18500;
  MaterialColor warning = const MaterialColor(_warning, {
    100: Color(0xFFFAF3C7),
    200: Color(0xFFF7E694),
    300: Color(0xFFE7CC5B),
    400: Color(0xFFD0AD35),
    500: Color(_warning),
    600: Color(0xFF986E00),
    700: Color(0xFF815901),
    800: Color(0xFF674400),
    900: Color(0xFF553600),
  });

  static const int _error = 0xFFF40000;
  MaterialColor error = const MaterialColor(_error, {
    100: Color(0xFFFEDDCB),
    200: Color(0xFFFDB298),
    300: Color(0xFFFB7E64),
    400: Color(0xFFF84E3E),
    500: Color(_error),
    600: Color(0xFFD10012),
    700: Color(0xFFAF001E),
    800: Color(0xFF8D0024),
    900: Color(0xFF750028),
  });

  static const int _neutral = 0xFFBDBDBD;
  static List<Color> neutralColor = const [
    Color(0xFFFFFFFF),
    Color(0xFFFAFAFA),
    Color(0xFFF2F2F2),
    Color(0xFFE0E0E0),
    Color(_neutral),
    Color(0xFF828282),
    Color(0xFF4A4A4A),
    Color(0xFF333333),
    Color(0xFF000000),
  ];

  void reverseNeutralColor() {
    neutralColor = neutralColor.reversed.toList();
    neutral = MaterialColor(_neutral, {
      100: neutralColor[0],
      200: neutralColor[1],
      300: neutralColor[2],
      400: neutralColor[3],
      500: neutralColor[4],
      600: neutralColor[5],
      700: neutralColor[6],
      800: neutralColor[7],
      900: neutralColor[8],
    });
  }

  MaterialColor neutral = MaterialColor(_neutral, {
    100: neutralColor[0],
    200: neutralColor[1],
    300: neutralColor[2],
    400: neutralColor[3],
    500: neutralColor[4],
    600: neutralColor[5],
    700: neutralColor[6],
    800: neutralColor[7],
    900: neutralColor[8],
  });
}
