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

// Bool Provider that returns true if the timer is running.
final StateProvider<bool> isRunningProvider =
    StateProvider<bool>((StateProviderRef<bool> ref) {
  return false;
});

// Bool Provider that returns true if the user selected the bike sound.
final StateProvider<bool> isBikeBellProvider =
    StateProvider<bool>((StateProviderRef<bool> ref) {
  return true;
});

// String Provider that returns the selected mp3 file to play according to
// the isBikeBellProvider.
final StateProvider<String> bellSoundProvider =
    StateProvider<String>((StateProviderRef<String> ref) {
  if (ref.watch(isBikeBellProvider)) {
    return 'assets/bell_bike.mp3';
  } else {
    return 'assets/bell_reception.mp3';
  }
});
