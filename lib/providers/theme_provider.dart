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
// flexSchemeProvider and the fontscheme is based on fontFamilyProvider
final StateProvider<ThemeData> themeLightProvider =
    StateProvider<ThemeData>((StateProviderRef<ThemeData> ref) {
  return FlexThemeData.light(
    scheme: ref.watch(flexSchemeProvider),
    usedColors: 1,
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    blendLevel: 12,
    appBarStyle: FlexAppBarStyle.surface,
    tabBarStyle: FlexTabBarStyle.forAppBar,
    subThemesData: const FlexSubThemesData(
      blendTextTheme: true,
      thinBorderWidth: 2.0,
      thickBorderWidth: 4.0,
      adaptiveRemoveElevationTint: FlexAdaptive.all(),
      adaptiveElevationShadowsBack: FlexAdaptive.all(),
      adaptiveAppBarScrollUnderOff: FlexAdaptive.all(),
      defaultRadius: 12.0,
      elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
      elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
      segmentedButtonSchemeColor: SchemeColor.primary,
      inputDecoratorBorderType: FlexInputBorderType.underline,
      fabUseShape: true,
      fabSchemeColor: SchemeColor.primaryContainer,
      popupMenuRadius: 6.0,
      popupMenuElevation: 4.0,
      dialogBackgroundSchemeColor: SchemeColor.surfaceVariant,
      dialogRadius: 12.0,
      dialogElevation: 3.0,
      useInputDecoratorThemeInDialogs: true,
      timePickerDialogRadius: 12.0,
      timePickerElementRadius: 12.0,
      snackBarRadius: 12,
      snackBarElevation: 3,
      snackBarBackgroundSchemeColor: SchemeColor.inverseSurface,
      tabBarItemSchemeColor: SchemeColor.primary,
      tabBarUnselectedItemSchemeColor: SchemeColor.onSurfaceVariant,
      tabBarIndicatorSchemeColor: SchemeColor.primary,
      tabBarIndicatorSize: TabBarIndicatorSize.label,
      tabBarIndicatorWeight: 3,
      tabBarIndicatorTopRadius: 8,
      drawerElevation: 0.0,
      drawerBackgroundSchemeColor: SchemeColor.surface,
      drawerWidth: 300.0,
      drawerIndicatorSchemeColor: SchemeColor.primary,
      bottomSheetElevation: 3.0,
      bottomSheetModalElevation: 3.0,
      bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.primary,
      bottomNavigationBarUnselectedLabelSchemeColor: SchemeColor.onSurface,
      bottomNavigationBarSelectedIconSchemeColor: SchemeColor.primary,
      bottomNavigationBarUnselectedIconSchemeColor: SchemeColor.onSurface,
      bottomNavigationBarBackgroundSchemeColor: SchemeColor.surface,
      menuRadius: 6.0,
      menuElevation: 4.0,
      menuBarRadius: 0.0,
      menuBarElevation: 1.0,
      navigationBarSelectedLabelSchemeColor: SchemeColor.onSurface,
      navigationBarUnselectedLabelSchemeColor: SchemeColor.onSurface,
      navigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
      navigationBarUnselectedIconSchemeColor: SchemeColor.onSurface,
      navigationBarIndicatorSchemeColor: SchemeColor.primary,
      navigationBarIndicatorOpacity: 1.00,
      navigationBarBackgroundSchemeColor: SchemeColor.surface,
      navigationBarElevation: 0.0,
      navigationBarHeight: 66.0,
      navigationRailSelectedLabelSchemeColor: SchemeColor.onSurface,
      navigationRailUnselectedLabelSchemeColor: SchemeColor.onSurface,
      navigationRailSelectedIconSchemeColor: SchemeColor.onPrimary,
      navigationRailUnselectedIconSchemeColor: SchemeColor.onSurface,
      navigationRailIndicatorSchemeColor: SchemeColor.primary,
      navigationRailIndicatorOpacity: 1.00,
      navigationRailBackgroundSchemeColor: SchemeColor.surface,
      navigationRailLabelType: NavigationRailLabelType.none,
    ),
    keyColors: const FlexKeyColors(
      keepPrimary: true,
    ),
    tones: FlexTones.oneHue(Brightness.light),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    fontFamily: ref.watch(fontFamilyProvider),
  );
});

// ThemeData provider for dark theme, the colorscheme is based on
// flexSchemeProvider and the fontscheme is based on fontFamilyProvider
final StateProvider<ThemeData> themeDarkProvider =
    StateProvider<ThemeData>((StateProviderRef<ThemeData> ref) {
  return FlexThemeData.dark(
    scheme: ref.watch(flexSchemeProvider),
    usedColors: 1,
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    blendLevel: 24,
    appBarStyle: FlexAppBarStyle.scaffoldBackground,
    tabBarStyle: FlexTabBarStyle.forAppBar,
    subThemesData: const FlexSubThemesData(
      blendTextTheme: true,
      adaptiveRemoveElevationTint: FlexAdaptive.all(),
      adaptiveElevationShadowsBack: FlexAdaptive.all(),
      adaptiveAppBarScrollUnderOff: FlexAdaptive.all(),
      defaultRadius: 12.0,
      thinBorderWidth: 2.0,
      thickBorderWidth: 4.0,
      elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
      elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
      segmentedButtonSchemeColor: SchemeColor.primary,
      inputDecoratorBorderType: FlexInputBorderType.underline,
      fabUseShape: true,
      fabSchemeColor: SchemeColor.primaryContainer,
      popupMenuRadius: 6.0,
      popupMenuElevation: 4.0,
      dialogBackgroundSchemeColor: SchemeColor.surfaceVariant,
      dialogRadius: 12.0,
      dialogElevation: 3.0,
      useInputDecoratorThemeInDialogs: true,
      timePickerDialogRadius: 12.0,
      timePickerElementRadius: 12.0,
      snackBarRadius: 12,
      snackBarElevation: 3,
      snackBarBackgroundSchemeColor: SchemeColor.inverseSurface,
      tabBarIndicatorSize: TabBarIndicatorSize.label,
      tabBarIndicatorWeight: 3,
      tabBarIndicatorTopRadius: 8,
      drawerElevation: 0.0,
      drawerBackgroundSchemeColor: SchemeColor.surface,
      drawerWidth: 300.0,
      drawerIndicatorSchemeColor: SchemeColor.primary,
      bottomSheetElevation: 3.0,
      bottomSheetModalElevation: 3.0,
      bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.primary,
      bottomNavigationBarUnselectedLabelSchemeColor: SchemeColor.onSurface,
      bottomNavigationBarSelectedIconSchemeColor: SchemeColor.primary,
      bottomNavigationBarUnselectedIconSchemeColor: SchemeColor.onSurface,
      bottomNavigationBarBackgroundSchemeColor: SchemeColor.surface,
      menuRadius: 6.0,
      menuElevation: 4.0,
      menuBarRadius: 0.0,
      menuBarElevation: 1.0,
      navigationBarSelectedLabelSchemeColor: SchemeColor.onSurface,
      navigationBarUnselectedLabelSchemeColor: SchemeColor.onSurface,
      navigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
      navigationBarUnselectedIconSchemeColor: SchemeColor.onSurface,
      navigationBarIndicatorSchemeColor: SchemeColor.primary,
      navigationBarIndicatorOpacity: 1.00,
      navigationBarBackgroundSchemeColor: SchemeColor.surface,
      navigationBarElevation: 0.0,
      navigationBarHeight: 66.0,
      navigationRailSelectedLabelSchemeColor: SchemeColor.onSurface,
      navigationRailUnselectedLabelSchemeColor: SchemeColor.onSurface,
      navigationRailSelectedIconSchemeColor: SchemeColor.onPrimary,
      navigationRailUnselectedIconSchemeColor: SchemeColor.onSurface,
      navigationRailIndicatorSchemeColor: SchemeColor.primary,
      navigationRailIndicatorOpacity: 1.00,
      navigationRailBackgroundSchemeColor: SchemeColor.surface,
      navigationRailLabelType: NavigationRailLabelType.none,
    ),
    keyColors: const FlexKeyColors(),
    tones: FlexTones.oneHue(Brightness.dark),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    fontFamily: ref.watch(fontFamilyProvider),
  );
});
