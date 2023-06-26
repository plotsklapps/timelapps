import 'package:timelapps/all_imports.dart';

// Bool provider for light/dark theme
final StateProvider<bool> isThemeLightProvider =
    StateProvider<bool>((StateProviderRef<bool> ref) {
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
final StateProvider<bool> isThemeGreenProvider =
    StateProvider<bool>((StateProviderRef<bool> ref) {
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

// Bool provider for red/blue color of the TimerPainter
final StateProvider<bool> isColorRedProvider =
    StateProvider<bool>((StateProviderRef<bool> ref) {
  return true;
});

// Bool provider for questrial/bebas neue font
final StateProvider<bool> isFontQuestrialProvider =
    StateProvider<bool>((StateProviderRef<bool> ref) {
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
final StateProvider<bool> isMinutesShownProvider =
    StateProvider<bool>((StateProviderRef<bool> ref) {
  return true;
});

// Bool provider to toggle Text widget showing minutes on/off
final StateProvider<bool> isTimeShownProvider =
    StateProvider<bool>((StateProviderRef<bool> ref) {
  return true;
});

// ThemeData provider for light theme, the colorscheme is based on
// flexSchemeProvider
final StateProvider<ThemeData> themeLightProvider =
    StateProvider<ThemeData>((StateProviderRef<ThemeData> ref) {
  return FlexThemeData.light(
    scheme: ref.watch(flexSchemeProvider),
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    blendLevel: 30,
    appBarStyle: FlexAppBarStyle.background,
    bottomAppBarElevation: 6.0,
    subThemesData: const FlexSubThemesData(
      blendTextTheme: true,
      useTextTheme: true,
      thinBorderWidth: 2.0,
      thickBorderWidth: 4.0,
      defaultRadius: 24.0,
      elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
      elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
      outlinedButtonOutlineSchemeColor: SchemeColor.primary,
      toggleButtonsBorderSchemeColor: SchemeColor.primary,
      segmentedButtonSchemeColor: SchemeColor.primary,
      segmentedButtonBorderSchemeColor: SchemeColor.primary,
      unselectedToggleIsColored: true,
      sliderValueTinted: true,
      inputDecoratorBorderType: FlexInputBorderType.underline,
      fabUseShape: true,
      chipRadius: 24.0,
      popupMenuRadius: 6.0,
      popupMenuElevation: 6.0,
      timePickerElementRadius: 24.0,
      snackBarRadius: 24,
      snackBarElevation: 6,
      appBarScrolledUnderElevation: 8.0,
      tabBarIndicatorWeight: 3,
      tabBarIndicatorTopRadius: 8,
      drawerElevation: 6.0,
      drawerWidth: 280.0,
      drawerIndicatorSchemeColor: SchemeColor.primary,
      bottomSheetElevation: 6.0,
      bottomSheetModalElevation: 6.0,
      bottomNavigationBarElevation: 6.0,
      menuRadius: 6.0,
      menuElevation: 6.0,
      menuBarRadius: 0.0,
      menuBarElevation: 1.0,
      navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
      navigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
      navigationBarIndicatorSchemeColor: SchemeColor.primary,
      navigationBarIndicatorOpacity: 1.00,
      navigationBarIndicatorRadius: 24.0,
      navigationBarElevation: 6.0,
      navigationBarHeight: 60.0,
      navigationRailSelectedLabelSchemeColor: SchemeColor.primary,
      navigationRailSelectedIconSchemeColor: SchemeColor.onPrimary,
      navigationRailIndicatorSchemeColor: SchemeColor.primary,
      navigationRailIndicatorOpacity: 1.00,
      navigationRailIndicatorRadius: 24.0,
      navigationRailElevation: 6.0,
    ),
    keyColors: const FlexKeyColors(
      useSecondary: true,
      useTertiary: true,
      keepPrimary: true,
      keepTertiary: true,
    ),
    tones: FlexTones.vividBackground(Brightness.light),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: ref.watch(fontFamilyProvider),
  );
});

// ThemeData provider for dark theme, the colorscheme is based on
// flexSchemeProvider
final StateProvider<ThemeData> themeDarkProvider =
    StateProvider<ThemeData>((StateProviderRef<ThemeData> ref) {
  return FlexThemeData.dark(
    scheme: ref.watch(flexSchemeProvider),
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    blendLevel: 15,
    appBarStyle: FlexAppBarStyle.background,
    bottomAppBarElevation: 2.0,
    subThemesData: const FlexSubThemesData(
      blendTextTheme: true,
      useTextTheme: true,
      defaultRadius: 24.0,
      thinBorderWidth: 2.0,
      thickBorderWidth: 4.0,
      elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
      elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
      outlinedButtonOutlineSchemeColor: SchemeColor.primary,
      toggleButtonsBorderSchemeColor: SchemeColor.primary,
      segmentedButtonSchemeColor: SchemeColor.primary,
      segmentedButtonBorderSchemeColor: SchemeColor.primary,
      unselectedToggleIsColored: true,
      sliderValueTinted: true,
      inputDecoratorBorderType: FlexInputBorderType.underline,
      fabUseShape: true,
      chipRadius: 24.0,
      popupMenuRadius: 6.0,
      popupMenuElevation: 6.0,
      timePickerElementRadius: 24.0,
      snackBarRadius: 24,
      snackBarElevation: 6,
      tabBarIndicatorWeight: 3,
      tabBarIndicatorTopRadius: 8,
      drawerElevation: 6.0,
      drawerWidth: 280.0,
      drawerIndicatorSchemeColor: SchemeColor.primary,
      bottomSheetElevation: 6.0,
      bottomSheetModalElevation: 6.0,
      bottomNavigationBarElevation: 6.0,
      menuRadius: 6.0,
      menuElevation: 6.0,
      menuBarRadius: 0.0,
      menuBarElevation: 1.0,
      navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
      navigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
      navigationBarIndicatorSchemeColor: SchemeColor.primary,
      navigationBarIndicatorOpacity: 1.00,
      navigationBarIndicatorRadius: 24.0,
      navigationBarElevation: 6.0,
      navigationBarHeight: 60.0,
      navigationRailSelectedLabelSchemeColor: SchemeColor.primary,
      navigationRailSelectedIconSchemeColor: SchemeColor.onPrimary,
      navigationRailIndicatorSchemeColor: SchemeColor.primary,
      navigationRailIndicatorOpacity: 1.00,
      navigationRailIndicatorRadius: 24.0,
      navigationRailElevation: 6.0,
    ),
    keyColors: const FlexKeyColors(
      useSecondary: true,
      useTertiary: true,
      keepPrimary: true,
    ),
    tones: FlexTones.vividBackground(Brightness.dark),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: ref.watch(fontFamilyProvider),
  );
});
