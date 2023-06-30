import 'package:timelapps/all_imports.dart';

// Providers that store the current state of the trafficlight related variables,
// they are provided by the user and used to update the UI and to perform
// the trafficlight logic.

final StateProvider<bool> isRedOnProvider =
    StateProvider<bool>((StateProviderRef<bool> ref) {
  return false;
});

final StateProvider<bool> isYellowOnProvider =
    StateProvider<bool>((StateProviderRef<bool> ref) {
  return false;
});

final StateProvider<bool> isGreenOnProvider =
    StateProvider<bool>((StateProviderRef<bool> ref) {
  return true;
});

final StateProvider<bool> isOutsideVoiceOnProvider =
    StateProvider<bool>((StateProviderRef<bool> ref) {
  return false;
});

final StateProvider<bool> isPresentationVoiceOnProvider =
    StateProvider<bool>((StateProviderRef<bool> ref) {
  return false;
});

final StateProvider<bool> isTalkingVoiceOnProvider =
    StateProvider<bool>((StateProviderRef<bool> ref) {
  return false;
});

final StateProvider<bool> isWorkingVoiceOnProvider =
    StateProvider<bool>((StateProviderRef<bool> ref) {
  return false;
});

final StateProvider<bool> isWhisperingOnProvider =
    StateProvider<bool>((StateProviderRef<bool> ref) {
  return false;
});

final StateProvider<bool> isSilenceOnProvider =
    StateProvider<bool>((StateProviderRef<bool> ref) {
  return false;
});

final List<String> noiseNamesList = <String>[
  'Outside voice',
  'Presentation voice',
  'Talking voice',
  'Working voice',
  'Whispering',
  'Silence',
];

final StateProvider<String> noiseNameProvider = StateProvider<String>(
  (StateProviderRef<String> ref) {
    return noiseNamesList[0];
  },
);
