import 'package:timelapps/all_imports.dart';

final StateProvider<double> secondsProvider = StateProvider<double>((ref) {
  return 15;
});

final StateProvider<double> minutesProvider = StateProvider<double>((ref) {
  return 15;
});

final StateProvider<bool> isRunningProvider = StateProvider<bool>((ref) {
  return false;
});
