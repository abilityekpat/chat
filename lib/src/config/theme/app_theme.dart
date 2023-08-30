import 'package:flutter/material.dart';

import '../../core/shared/resources/colors.dart';

abstract class AppTheme {
  static ThemeData get defaultTheme {
    return ThemeData(
        scaffoldBackgroundColor: AppColors.white, fontFamily: 'Montserrat');
  }
}
