import 'package:timelapps/all_imports.dart';

// Providers that store the current state of the trafficlight related variables,
// they are provided by the user and used to update the UI and to perform
// the trafficlight logic.

final StateProvider<bool> isRedOnProvider =
    StateProvider<bool>((StateProviderRef<bool> ref) {
  return true;
});

final StateProvider<bool> isYellowOnProvider =
    StateProvider<bool>((StateProviderRef<bool> ref) {
  return false;
});

final StateProvider<bool> isGreenOnProvider =
    StateProvider<bool>((StateProviderRef<bool> ref) {
  return false;
});

final StateProvider<bool> isOneOnProvider =
    StateProvider<bool>((StateProviderRef<bool> ref) {
  return false;
});

final StateProvider<bool> isTwoOnProvider =
    StateProvider<bool>((StateProviderRef<bool> ref) {
  return false;
});

final StateProvider<bool> isThreeOnProvider =
    StateProvider<bool>((StateProviderRef<bool> ref) {
  return false;
});

final StateProvider<bool> isFourOnProvider =
    StateProvider<bool>((StateProviderRef<bool> ref) {
  return false;
});

final StateProvider<bool> isFiveOnProvider =
    StateProvider<bool>((StateProviderRef<bool> ref) {
  return false;
});

final StateProvider<bool> isSixOnProvider =
    StateProvider<bool>((StateProviderRef<bool> ref) {
  return false;
});
