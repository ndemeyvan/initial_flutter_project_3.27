import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maliya_mobile/1_share/presentation/themes/maliya_colors.dart';

class MaliyaTheme {
  static ThemeData themeData(BuildContext context, {bool isDarkTheme = false}) {
    return ThemeData(
      useMaterial3: true,
      primarySwatch: MaliyaColors.createMaterialColor(MaliyaColors.primary),
      primaryColor: MaliyaColors.primary,
      tabBarTheme: const TabBarTheme(
        dividerColor: Colors.transparent,
      ),
      cardColor: isDarkTheme ? MaliyaColors.secondary : MaliyaColors.white,
      colorScheme: ColorScheme(
        primary: MaliyaColors.primary,
        secondary: MaliyaColors.secondary,
        tertiary: isDarkTheme ? Colors.white.withOpacity(.02) : MaliyaColors.grey3,
        surface: isDarkTheme ? MaliyaColors.background : MaliyaColors.grey4,
        background: isDarkTheme ? MaliyaColors.background : MaliyaColors.grey4,
        error: MaliyaColors.red,
        onPrimary: MaliyaColors.grey4,
        onSecondary: MaliyaColors.grey4,
        onSurface: isDarkTheme ? MaliyaColors.lightText : MaliyaColors.secondary,
        onBackground: isDarkTheme ? MaliyaColors.lightText : MaliyaColors.secondary,
        onError: MaliyaColors.white,
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      ),
      textTheme: isDarkTheme
          ? _textTheme(ThemeData.dark().textTheme, MaliyaColors.lightText)
          : _textTheme(ThemeData.light().textTheme, MaliyaColors.secondary),
      iconTheme: const IconThemeData(color: MaliyaColors.grey),
      drawerTheme: const DrawerThemeData(
        backgroundColor: MaliyaColors.white,
        scrimColor: Colors.transparent,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
    );
  }

  static TextTheme _textTheme(TextTheme base, Color color) {
    return base
        .copyWith(
          displayLarge: base.displayLarge!.copyWith(
            fontWeight: FontWeight.w300,
            fontSize: 96.sp,
          ),
          displayMedium: base.displayMedium!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 60.sp,
          ),
          displaySmall: base.displaySmall!.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 48.sp,
          ),
          headlineLarge: base.headlineLarge!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 34.sp,
          ),
          headlineMedium: base.headlineMedium!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 24.sp,
          ),
          headlineSmall: base.headlineSmall!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
          ),
          titleLarge: base.titleLarge!.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
          ),
          titleMedium: base.titleMedium!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 15.sp,
          ),
          bodyLarge: base.bodyLarge!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 15.sp,
          ),
          bodyMedium: base.bodyMedium!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
          ),
          bodySmall: base.bodySmall!.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
            color: MaliyaColors.grey,
          ),
          labelLarge: base.labelLarge!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
          ),
          labelMedium: base.labelSmall!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 13.sp,
          ),
          labelSmall: base.labelSmall!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
          ),
        )
        .apply(
          fontFamily: 'Poppins',
          bodyColor: color,
          displayColor: color,
        );
  }
}
