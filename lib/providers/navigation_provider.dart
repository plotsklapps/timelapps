import 'package:timelapps/all_imports.dart';

// This Provider stores and returns an int for the selectedIndex parameter of
// the TimerNavigationRail.
final StateProvider<int> selectedTimerRailIndexProvider =
    StateProvider<int>((StateProviderRef<int> ref) {
  return 0;
});

// This Provider stores and returns an int for the selectedIndex parameter of
// the NoiseNavigationRail.
final StateProvider<int> selectedNoiseRailIndexProvider =
    StateProvider<int>((StateProviderRef<int> ref) {
  return 0;
});

// This Provider stores and returns an int for the selectedIndex parameter of
// the DualNavigationRail.
final StateProvider<int> selectedDualRailIndexProvider =
    StateProvider<int>((StateProviderRef<int> ref) {
  return 0;
});
