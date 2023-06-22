import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

// Theme config for FlexColorScheme version 7.1.x. Make sure you use
// same or higher package version, but still same major version. If you
// use a lower package version, some properties may not be supported.
// In that case remove them after copying this theme to your app.
ThemeData themeLight = FlexThemeData.light(
  scheme: FlexScheme.money,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 24,
  subThemesData: const FlexSubThemesData(
    blendTextTheme: true,
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    thinBorderWidth: 2.0,
    thickBorderWidth: 4.0,
    defaultRadius: 24.0,
    inputDecoratorBorderType: FlexInputBorderType.underline,
    fabUseShape: true,
    drawerWidth: 300.0,
    navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
    navigationBarUnselectedLabelSchemeColor: SchemeColor.onSurface,
    navigationBarSelectedIconSchemeColor: SchemeColor.primary,
    navigationBarUnselectedIconSchemeColor: SchemeColor.onSurface,
    navigationBarIndicatorSchemeColor: SchemeColor.secondaryContainer,
    navigationBarIndicatorOpacity: 1.00,
    navigationBarIndicatorRadius: 24.0,
    navigationRailSelectedLabelSchemeColor: SchemeColor.primary,
    navigationRailUnselectedLabelSchemeColor: SchemeColor.onSurface,
    navigationRailSelectedIconSchemeColor: SchemeColor.primary,
    navigationRailUnselectedIconSchemeColor: SchemeColor.onSurface,
    navigationRailIndicatorSchemeColor: SchemeColor.secondaryContainer,
    navigationRailIndicatorOpacity: 1.00,
    navigationRailIndicatorRadius: 24.0,
    navigationRailBackgroundSchemeColor: SchemeColor.surface,
    navigationRailLabelType: NavigationRailLabelType.none,
  ),
  keyColors: const FlexKeyColors(),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
// To use the Playground font, add GoogleFonts package and uncomment
// fontFamily: GoogleFonts.notoSans().fontFamily,
);
ThemeData darkTheme = FlexThemeData.dark(
  scheme: FlexScheme.money,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 13,
  subThemesData: const FlexSubThemesData(
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    defaultRadius: 24.0,
    thinBorderWidth: 2.0,
    thickBorderWidth: 4.0,
    inputDecoratorBorderType: FlexInputBorderType.underline,
    fabUseShape: true,
    drawerWidth: 300.0,
    navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
    navigationBarUnselectedLabelSchemeColor: SchemeColor.onSurface,
    navigationBarSelectedIconSchemeColor: SchemeColor.primary,
    navigationBarUnselectedIconSchemeColor: SchemeColor.onSurface,
    navigationBarIndicatorSchemeColor: SchemeColor.secondaryContainer,
    navigationBarIndicatorOpacity: 1.00,
    navigationBarIndicatorRadius: 24.0,
    navigationRailSelectedLabelSchemeColor: SchemeColor.primary,
    navigationRailUnselectedLabelSchemeColor: SchemeColor.onSurface,
    navigationRailSelectedIconSchemeColor: SchemeColor.primary,
    navigationRailUnselectedIconSchemeColor: SchemeColor.onSurface,
    navigationRailIndicatorSchemeColor: SchemeColor.secondaryContainer,
    navigationRailIndicatorOpacity: 1.00,
    navigationRailIndicatorRadius: 24.0,
    navigationRailBackgroundSchemeColor: SchemeColor.surface,
    navigationRailLabelType: NavigationRailLabelType.none,
  ),
  keyColors: const FlexKeyColors(),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
// To use the Playground font, add GoogleFonts package and uncomment
// fontFamily: GoogleFonts.notoSans().fontFamily,
);
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,
