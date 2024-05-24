import 'dart:ui';

import 'package:flutter/material.dart';

// const colours for fonts , background particular widgets all are defined
// but only use const colours when multiple places these colours are getting
// used. else for just 1-2 place we should always use custom colors on the
// screen itself.

class Colours {
  const Colours._(); // private constructor , so we can not mistakenly
  // instantiate this class from outside any other class. cause private
  // constructor can not be instantiated cause its private.

  /// #EDF8FF #FDC1E8, #FDFAE1, #FFFFFF
  static const gradient = [
    Color(0xFFEDF8FF),
    Color(0xFFFDC1E8),
    Color(0xFFFFFFFF),
    Color(0xFFFDFAE1),
  ];

  static const loginScreenGreenGradient = Color(0xFF0E4D27);
  static const loginSceenBlackGradient = Colors.black;

  /// #458CFF
  static const primaryColour = Color(0xFF0cba48);
  static const primaryColourLight = Color(0xFF253f36);

  /// #757C8E
  static const whiteTextColour = Color(0xFFfefefe);
  static const lightWhiteTextColour = Color(0xFF929296);
  static const greyTextColour = Colors.grey;

  /// #FF5C5C
  static const redColour = Color(0xFFFF5C5C);

  static const backgroundColourLightDark = Color(0xFF171719);

  static const backgroundColorDark = Color(0xFF05050f);

  static const dashBoardIconColour = Color(0xFF8f8f94);

  static const grey = Colors.grey;
  static const greyBackground = Color(0xFF2f343b);

  static const white = Colors.white;

  static const whiteIconsColor = Color(0xFFfafafb);
  static const greyIconColor = Colors.grey;
}
