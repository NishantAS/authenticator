import "package:authenticator/core/services/service_locator.dart";
import "package:authenticator/core/storage/local_storage.dart";
import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  static ThemeMode get themeMode => sl<LocalStorage>().getTheme();

  static set themeMode(ThemeMode theme) => sl<LocalStorage>().setTheme(theme);

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff435e91),
      surfaceTint: Color(0xff435e91),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffd7e2ff),
      onPrimaryContainer: Color(0xff001a40),
      secondary: Color(0xff565e71),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffdae2f9),
      onSecondaryContainer: Color(0xff131b2c),
      tertiary: Color(0xff715574),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xfffbd7fc),
      onTertiaryContainer: Color(0xff29132d),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfff9f9ff),
      onSurface: Color(0xff1a1b20),
      onSurfaceVariant: Color(0xff44474f),
      outline: Color(0xff74777f),
      outlineVariant: Color(0xffc4c6d0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f3036),
      inversePrimary: Color(0xffacc7ff),
      primaryFixed: Color(0xffd7e2ff),
      onPrimaryFixed: Color(0xff001a40),
      primaryFixedDim: Color(0xffacc7ff),
      onPrimaryFixedVariant: Color(0xff2a4678),
      secondaryFixed: Color(0xffdae2f9),
      onSecondaryFixed: Color(0xff131b2c),
      secondaryFixedDim: Color(0xffbec6dc),
      onSecondaryFixedVariant: Color(0xff3f4759),
      tertiaryFixed: Color(0xfffbd7fc),
      onTertiaryFixed: Color(0xff29132d),
      tertiaryFixedDim: Color(0xffdebcdf),
      onTertiaryFixedVariant: Color(0xff583e5b),
      surfaceDim: Color(0xffd9d9e0),
      surfaceBright: Color(0xfff9f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff3f3fa),
      surfaceContainer: Color(0xffededf4),
      surfaceContainerHigh: Color(0xffe8e7ee),
      surfaceContainerHighest: Color(0xffe2e2e9),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff264273),
      surfaceTint: Color(0xff435e91),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff5a74a9),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff3b4355),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff6c7488),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff533a57),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff886b8b),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff9f9ff),
      onSurface: Color(0xff1a1b20),
      onSurfaceVariant: Color(0xff40434b),
      outline: Color(0xff5c5f67),
      outlineVariant: Color(0xff787a83),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f3036),
      inversePrimary: Color(0xffacc7ff),
      primaryFixed: Color(0xff5a74a9),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff415c8e),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff6c7488),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff545c6f),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff886b8b),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff6e5371),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd9d9e0),
      surfaceBright: Color(0xfff9f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff3f3fa),
      surfaceContainer: Color(0xffededf4),
      surfaceContainerHigh: Color(0xffe8e7ee),
      surfaceContainerHighest: Color(0xffe2e2e9),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00214d),
      surfaceTint: Color(0xff435e91),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff264273),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff1a2233),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff3b4355),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff301a35),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff533a57),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff9f9ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff21242b),
      outline: Color(0xff40434b),
      outlineVariant: Color(0xff40434b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f3036),
      inversePrimary: Color(0xffe6ecff),
      primaryFixed: Color(0xff264273),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff092b5c),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff3b4355),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff252d3e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff533a57),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff3c2440),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd9d9e0),
      surfaceBright: Color(0xfff9f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff3f3fa),
      surfaceContainer: Color(0xffededf4),
      surfaceContainerHigh: Color(0xffe8e7ee),
      surfaceContainerHighest: Color(0xffe2e2e9),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffacc7ff),
      surfaceTint: Color(0xffacc7ff),
      onPrimary: Color(0xff0f2f60),
      primaryContainer: Color(0xff2a4678),
      onPrimaryContainer: Color(0xffd7e2ff),
      secondary: Color(0xffbec6dc),
      onSecondary: Color(0xff283041),
      secondaryContainer: Color(0xff3f4759),
      onSecondaryContainer: Color(0xffdae2f9),
      tertiary: Color(0xffdebcdf),
      onTertiary: Color(0xff402844),
      tertiaryContainer: Color(0xff583e5b),
      onTertiaryContainer: Color(0xfffbd7fc),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff111318),
      onSurface: Color(0xffe2e2e9),
      onSurfaceVariant: Color(0xffc4c6d0),
      outline: Color(0xff8e9099),
      outlineVariant: Color(0xff44474f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe2e2e9),
      inversePrimary: Color(0xff435e91),
      primaryFixed: Color(0xffd7e2ff),
      onPrimaryFixed: Color(0xff001a40),
      primaryFixedDim: Color(0xffacc7ff),
      onPrimaryFixedVariant: Color(0xff2a4678),
      secondaryFixed: Color(0xffdae2f9),
      onSecondaryFixed: Color(0xff131b2c),
      secondaryFixedDim: Color(0xffbec6dc),
      onSecondaryFixedVariant: Color(0xff3f4759),
      tertiaryFixed: Color(0xfffbd7fc),
      onTertiaryFixed: Color(0xff29132d),
      tertiaryFixedDim: Color(0xffdebcdf),
      onTertiaryFixedVariant: Color(0xff583e5b),
      surfaceDim: Color(0xff111318),
      surfaceBright: Color(0xff37393e),
      surfaceContainerLowest: Color(0xff0c0e13),
      surfaceContainerLow: Color(0xff1a1b20),
      surfaceContainer: Color(0xff1e2025),
      surfaceContainerHigh: Color(0xff282a2f),
      surfaceContainerHighest: Color(0xff33353a),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffb3cbff),
      surfaceTint: Color(0xffacc7ff),
      onPrimary: Color(0xff001536),
      primaryContainer: Color(0xff7691c7),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffc3cae1),
      onSecondary: Color(0xff0e1626),
      secondaryContainer: Color(0xff8991a5),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffe2c0e4),
      onTertiary: Color(0xff230d28),
      tertiaryContainer: Color(0xffa687a8),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff111318),
      onSurface: Color(0xfffbfaff),
      onSurfaceVariant: Color(0xffc9cad4),
      outline: Color(0xffa0a2ac),
      outlineVariant: Color(0xff81838c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe2e2e9),
      inversePrimary: Color(0xff2b4779),
      primaryFixed: Color(0xffd7e2ff),
      onPrimaryFixed: Color(0xff00102d),
      primaryFixedDim: Color(0xffacc7ff),
      onPrimaryFixedVariant: Color(0xff173566),
      secondaryFixed: Color(0xffdae2f9),
      onSecondaryFixed: Color(0xff091121),
      secondaryFixedDim: Color(0xffbec6dc),
      onSecondaryFixedVariant: Color(0xff2e3647),
      tertiaryFixed: Color(0xfffbd7fc),
      onTertiaryFixed: Color(0xff1e0822),
      tertiaryFixedDim: Color(0xffdebcdf),
      onTertiaryFixedVariant: Color(0xff462d4a),
      surfaceDim: Color(0xff111318),
      surfaceBright: Color(0xff37393e),
      surfaceContainerLowest: Color(0xff0c0e13),
      surfaceContainerLow: Color(0xff1a1b20),
      surfaceContainer: Color(0xff1e2025),
      surfaceContainerHigh: Color(0xff282a2f),
      surfaceContainerHighest: Color(0xff33353a),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffbfaff),
      surfaceTint: Color(0xffacc7ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffb3cbff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffbfaff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffc3cae1),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffff9fa),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffe2c0e4),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff111318),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffbfaff),
      outline: Color(0xffc9cad4),
      outlineVariant: Color(0xffc9cad4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe2e2e9),
      inversePrimary: Color(0xff052959),
      primaryFixed: Color(0xffdee7ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffb3cbff),
      onPrimaryFixedVariant: Color(0xff001536),
      secondaryFixed: Color(0xffdfe7fd),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffc3cae1),
      onSecondaryFixedVariant: Color(0xff0e1626),
      tertiaryFixed: Color(0xfffedcff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffe2c0e4),
      onTertiaryFixedVariant: Color(0xff230d28),
      surfaceDim: Color(0xff111318),
      surfaceBright: Color(0xff37393e),
      surfaceContainerLowest: Color(0xff0c0e13),
      surfaceContainerLow: Color(0xff1a1b20),
      surfaceContainer: Color(0xff1e2025),
      surfaceContainerHigh: Color(0xff282a2f),
      surfaceContainerHighest: Color(0xff33353a),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
