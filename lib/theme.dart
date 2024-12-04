// app_theme.dart
import 'package:flutter/material.dart';

class AppTheme with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  static final light = ThemeData.light().copyWith(
    extensions: [
      _lightAppColors,
    ],
    appBarTheme: AppBarTheme(
      backgroundColor: _lightAppColors.pageBgColor,
      iconTheme: IconThemeData(color: _lightAppColors.textHeaderColor),
      titleTextStyle: TextStyle(color: _lightAppColors.textHeaderColor),
    ),
  );

  static final _lightAppColors = AppColorsExtension(
    pageBgColor: const Color(0xFFFFFFFF),
    cardBgColor1: const Color(0xFFF7F7F7),
    stokeIconColor: const Color(0xFFEAECF0),
    textHeaderColor: const Color(0xFF0D111C),
    textBodyColor: const Color(0xFF8D9DA8),
    brandColor: const Color(0xFF4E61FF),
    whiteColor: const Color(0xFFFFFFFF),
    blackColor: const Color(0xFF000000),
    formInputColor: const Color(0xFF999CA0),
    greyTiaryButnColor: const Color(0xFFEBEBEB),
    cardBgColor2: const Color(0xFFEBEBEB),
    textBgColor: const Color(0xFF6F6D6D),
  );

  static final dark = ThemeData.dark().copyWith(
    extensions: [
      _darkAppColors,
    ],
    appBarTheme: AppBarTheme(
      backgroundColor: _darkAppColors.pageBgColor,
      iconTheme: IconThemeData(color: _darkAppColors.textHeaderColor),
      titleTextStyle: TextStyle(color: _darkAppColors.textHeaderColor),
    ),
  );

  static final _darkAppColors = AppColorsExtension(
    pageBgColor: const Color(0XFF2C323A),
    cardBgColor1: const Color(0XFF1A212A),
    stokeIconColor: const Color(0XFF454B52),
    textHeaderColor: const Color(0XFFFFFFFF),
    textBodyColor: const Color(0XFF8D9DA8),
    brandColor: const Color(0xFF4E61FF),
    whiteColor: const Color(0xFFFFFFFF),
    blackColor: const Color(0xFF000000),
    formInputColor: const Color(0xFF999CA0),
    greyTiaryButnColor: const Color(0xFFEBEBEB),
    cardBgColor2: const Color(0xFF1A212A),
    textBgColor: const Color(0xFFEBEBEB),
  );

  static AppColorsExtension lightAppColors = _lightAppColors;
}

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  AppColorsExtension({
    required this.pageBgColor,
    required this.cardBgColor1,
    required this.stokeIconColor,
    required this.textHeaderColor,
    required this.textBodyColor,
    required this.brandColor,
    required this.whiteColor,
    required this.blackColor,
    required this.formInputColor,
    required this.greyTiaryButnColor,
    required this.cardBgColor2,
    required this.textBgColor,
  });

  final Color pageBgColor;
  final Color cardBgColor1;
  final Color stokeIconColor;
  final Color textHeaderColor;
  final Color textBodyColor;
  final Color brandColor;
  final Color whiteColor;
  final Color blackColor;
  final Color formInputColor;
  final Color greyTiaryButnColor;
  final Color cardBgColor2;
  final Color textBgColor;

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? pageBgColor,
    Color? cardBgColor1,
    Color? stokeIconColor,
    Color? textHeaderColor,
    Color? textBodyColor,
    Color? brandColor,
    Color? whiteColor,
    Color? blackColor,
    Color? formInputColor,
    Color? greyTiaryButnColor,
    Color? cardBgColor2,
    Color? textBgColor,
  }) {
    return AppColorsExtension(
      pageBgColor: pageBgColor ?? this.pageBgColor,
      cardBgColor1: cardBgColor1 ?? this.cardBgColor1,
      stokeIconColor: stokeIconColor ?? this.stokeIconColor,
      textHeaderColor: textHeaderColor ?? this.textHeaderColor,
      textBodyColor: textBodyColor ?? this.textBodyColor,
      brandColor: brandColor ?? this.brandColor,
      whiteColor: whiteColor ?? this.whiteColor,
      blackColor: blackColor ?? this.blackColor,
      formInputColor: formInputColor ?? this.formInputColor,
      greyTiaryButnColor: greyTiaryButnColor ?? this.greyTiaryButnColor,
      cardBgColor2: cardBgColor2 ?? this.cardBgColor2,
      textBgColor: textBgColor ?? this.textBgColor,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
      covariant ThemeExtension<AppColorsExtension>? other, double t) {
    if (other is! AppColorsExtension) {
      return this;
    }
    return AppColorsExtension(
      pageBgColor: Color.lerp(pageBgColor, other.pageBgColor, t)!,
      cardBgColor1: Color.lerp(cardBgColor1, other.cardBgColor1, t)!,
      stokeIconColor: Color.lerp(stokeIconColor, other.stokeIconColor, t)!,
      textHeaderColor: Color.lerp(textHeaderColor, other.textHeaderColor, t)!,
      textBodyColor: Color.lerp(textBodyColor, other.textBodyColor, t)!,
      brandColor: Color.lerp(brandColor, other.brandColor, t)!,
      whiteColor: Color.lerp(whiteColor, other.whiteColor, t)!,
      blackColor: Color.lerp(blackColor, other.blackColor, t)!,
      formInputColor: Color.lerp(formInputColor, other.formInputColor, t)!,
      greyTiaryButnColor: Color.lerp(greyTiaryButnColor, other.greyTiaryButnColor, t)!,
      cardBgColor2: Color.lerp(cardBgColor2, other.cardBgColor2, t)!,
      textBgColor: Color.lerp(textBgColor, other.textBgColor, t)!,
    );
  }
}

// Extension to easily access custom colors
extension AppThemeExtension on ThemeData {
  AppColorsExtension get appColors =>
      extension<AppColorsExtension>() ?? AppTheme.lightAppColors;
}