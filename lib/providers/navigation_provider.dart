import 'package:timelapps/all_imports.dart';

// This Provider stores and returns an int for the selectedIndex parameter of
// the NavigationRail.
final StateProvider<int> selectedDualRailIndexProvider =
    StateProvider<int>((StateProviderRef<int> ref) {
  return 0;
});
