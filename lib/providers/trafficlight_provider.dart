import 'package:timelapps/all_imports.dart';

// Providers that store the current state of the trafficlight related variables,
// they are provided by the user and used to update the UI and to perform
// the trafficlight logic.

final StateProvider<bool> isRedOnProvider = StateProvider<bool>((ref) {
  return true;
});

final StateProvider<bool> isYellowOnProvider = StateProvider<bool>((ref) {
  return false;
});

final StateProvider<bool> isGreenOnProvider = StateProvider<bool>((ref) {
  return false;
});
