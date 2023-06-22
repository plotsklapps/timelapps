import 'package:timelapps/all_imports.dart';

// Bool provider for light/dark theme
final StateProvider<bool> isThemeLightProvider = StateProvider<bool>((ref) {
  return true;
});

// ThemeMode provider for light/dark theme based on isThemeLightProvider
final StateProvider<ThemeMode> themeModeProvider =
    StateProvider<ThemeMode>((StateProviderRef<ThemeMode> ref) {
  final bool isThemeLight = ref.watch(isThemeLightProvider);
  if (!isThemeLight) {
    return ThemeMode.dark;
  } else {
    return ThemeMode.light;
  }
});

// Bool provider for green/red color scheme
final StateProvider<bool> isThemeGreenProvider = StateProvider<bool>((ref) {
  return true;
});

// FlexScheme provider for green/red color scheme based on isThemeGreenProvider
final StateProvider<FlexScheme> flexSchemeProvider =
    StateProvider<FlexScheme>((StateProviderRef<FlexScheme> ref) {
  final bool isThemeGreen = ref.watch(isThemeGreenProvider);
  if (!isThemeGreen) {
    return FlexScheme.redWine;
  } else {
    return FlexScheme.money;
  }
});

// Bool provider for questrial/bebas neue font
final StateProvider<bool> isFontQuestrialProvider = StateProvider<bool>((ref) {
  return true;
});

// Font provider for questrial/bebas neue font based on isFontQuestrialProvider
final StateProvider<String?> fontFamilyProvider =
    StateProvider<String?>((StateProviderRef<String?> ref) {
  final bool isFontQuestrial = ref.watch(isFontQuestrialProvider);
  if (!isFontQuestrial) {
    return GoogleFonts.bebasNeue().fontFamily;
  } else {
    return GoogleFonts.questrial().fontFamily;
  }
});

// Bool provider to toggle between minutes and seconds
final StateProvider<bool> isMinutesShownProvider = StateProvider<bool>((ref) {
  return true;
});

// Bool provider to toggle Text widget showing minutes on/off
final StateProvider<bool> isTimeShownProvider = StateProvider<bool>((ref) {
  return true;
});

// ThemeData provider for light theme, the colorscheme is based on
// flexSchemeProvider
final StateProvider<ThemeData> themeLightProvider =
    StateProvider<ThemeData>((ref) {
  return FlexThemeData.light(
    scheme: ref.watch(flexSchemeProvider),
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
    fontFamily: ref.watch(fontFamilyProvider),
  );
});

// ThemeData provider for light theme, the colorscheme is based on
// flexSchemeProvider
final StateProvider<ThemeData> themeDarkProvider =
    StateProvider<ThemeData>((ref) {
  return FlexThemeData.dark(
    scheme: ref.watch(flexSchemeProvider),
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
    fontFamily: ref.watch(fontFamilyProvider),
  );
});
