import 'package:timelapps/all_imports.dart';

// Providers that store the current state of the timer related variables,
// they are provided by the user and used to update the UI and to perform
// the timer logic.

final StateProvider<double> secondsProvider =
    StateProvider<double>((StateProviderRef<double> ref) {
  return 15;
});

final StateProvider<double> minutesProvider =
    StateProvider<double>((StateProviderRef<double> ref) {
  return 15;
});

final StateProvider<bool> isRunningProvider =
    StateProvider<bool>((StateProviderRef<bool> ref) {
  return false;
});
