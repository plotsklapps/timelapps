import 'package:timelapps/all_imports.dart';

final StateProvider<int> selectedNoiseRailIndexProvider =
    StateProvider<int>((StateProviderRef<int> ref) {
  return 0;
});

// This navigationrail holds multiple options for the user to select.
// The user can select themeMode, themeColor, circleColor, font, minutes/
// seconds and show timer or not. All values are stored in their respective
// Riverpod providers.
NavigationRail buildNoiseNavigationRail(
  BuildContext context,
  WidgetRef ref,
) {
  return NavigationRail(
    selectedIndex: ref.watch(selectedNoiseRailIndexProvider),
    onDestinationSelected: (int index) {
      ref.read(selectedNoiseRailIndexProvider.notifier).state = index;
      if (index == 0) {
        ref.read(isOutsideVoiceOnProvider.notifier).state =
            !ref.watch(isOutsideVoiceOnProvider);
        ref.read(noiseNameProvider.notifier).state = noiseNamesList[0];
        ref.read(isPresentationVoiceOnProvider.notifier).state = false;
        ref.read(isTalkingVoiceOnProvider.notifier).state = false;
        ref.read(isWorkingVoiceOnProvider.notifier).state = false;
        ref.read(isWhisperingOnProvider.notifier).state = false;
        ref.read(isSilenceOnProvider.notifier).state = false;
        ref.read(isRedOnProvider.notifier).state = false;
        ref.read(isYellowOnProvider.notifier).state = false;
        ref.read(isGreenOnProvider.notifier).state = true;
      } else if (index == 1) {
        ref.read(isPresentationVoiceOnProvider.notifier).state =
            !ref.watch(isPresentationVoiceOnProvider);
        ref.read(noiseNameProvider.notifier).state = noiseNamesList[1];
        ref.read(isOutsideVoiceOnProvider.notifier).state = false;
        ref.read(isTalkingVoiceOnProvider.notifier).state = false;
        ref.read(isWorkingVoiceOnProvider.notifier).state = false;
        ref.read(isWhisperingOnProvider.notifier).state = false;
        ref.read(isSilenceOnProvider.notifier).state = false;
        ref.read(isRedOnProvider.notifier).state = false;
        ref.read(isYellowOnProvider.notifier).state = false;
        ref.read(isGreenOnProvider.notifier).state = true;
      } else if (index == 2) {
        ref.read(isTalkingVoiceOnProvider.notifier).state =
            !ref.watch(isTalkingVoiceOnProvider);
        ref.read(noiseNameProvider.notifier).state = noiseNamesList[2];
        ref.read(isOutsideVoiceOnProvider.notifier).state = false;
        ref.read(isPresentationVoiceOnProvider.notifier).state = false;
        ref.read(isOutsideVoiceOnProvider.notifier).state = false;
        ref.read(isWorkingVoiceOnProvider.notifier).state = false;
        ref.read(isWhisperingOnProvider.notifier).state = false;
        ref.read(isSilenceOnProvider.notifier).state = false;
        ref.read(isRedOnProvider.notifier).state = false;
        ref.read(isYellowOnProvider.notifier).state = false;
        ref.read(isGreenOnProvider.notifier).state = true;
      } else if (index == 3) {
        ref.read(isWorkingVoiceOnProvider.notifier).state =
            !ref.watch(isWorkingVoiceOnProvider);
        ref.read(noiseNameProvider.notifier).state = noiseNamesList[3];
        ref.read(isOutsideVoiceOnProvider.notifier).state = false;
        ref.read(isPresentationVoiceOnProvider.notifier).state = false;
        ref.read(isTalkingVoiceOnProvider.notifier).state = false;
        ref.read(isWhisperingOnProvider.notifier).state = false;
        ref.read(isSilenceOnProvider.notifier).state = false;
        ref.read(isRedOnProvider.notifier).state = false;
        ref.read(isYellowOnProvider.notifier).state = true;
        ref.read(isGreenOnProvider.notifier).state = false;
      } else if (index == 4) {
        ref.read(isWhisperingOnProvider.notifier).state =
            !ref.watch(isWhisperingOnProvider);
        ref.read(noiseNameProvider.notifier).state = noiseNamesList[4];
        ref.read(isOutsideVoiceOnProvider.notifier).state = false;
        ref.read(isPresentationVoiceOnProvider.notifier).state = false;
        ref.read(isTalkingVoiceOnProvider.notifier).state = false;
        ref.read(isWorkingVoiceOnProvider.notifier).state = false;
        ref.read(isSilenceOnProvider.notifier).state = false;
        ref.read(isRedOnProvider.notifier).state = false;
        ref.read(isYellowOnProvider.notifier).state = true;
        ref.read(isGreenOnProvider.notifier).state = false;
      } else if (index == 5) {
        ref.read(noiseNameProvider.notifier).state = noiseNamesList[5];
        ref.read(isSilenceOnProvider.notifier).state =
            !ref.watch(isSilenceOnProvider);
        ref.read(isOutsideVoiceOnProvider.notifier).state = false;
        ref.read(isPresentationVoiceOnProvider.notifier).state = false;
        ref.read(isTalkingVoiceOnProvider.notifier).state = false;
        ref.read(isWorkingVoiceOnProvider.notifier).state = false;
        ref.read(isWhisperingOnProvider.notifier).state = false;
        ref.read(isRedOnProvider.notifier).state = true;
        ref.read(isYellowOnProvider.notifier).state = false;
        ref.read(isGreenOnProvider.notifier).state = false;
      }
    },
    labelType: NavigationRailLabelType.all,
    destinations: <NavigationRailDestination>[
      NavigationRailDestination(
        icon: ref.watch(isOutsideVoiceOnProvider)
            ? const Icon(FontAwesomeIcons.check)
            : const Icon(FontAwesomeIcons.bullhorn),
        label: const Text('Outside'),
      ),
      NavigationRailDestination(
        icon: ref.watch(isPresentationVoiceOnProvider)
            ? const Icon(FontAwesomeIcons.check)
            : const Icon(FontAwesomeIcons.personChalkboard),
        label: const Text('Presentation'),
      ),
      NavigationRailDestination(
        icon: ref.watch(isTalkingVoiceOnProvider)
            ? const Icon(FontAwesomeIcons.check)
            : const Icon(FontAwesomeIcons.volumeHigh),
        label: const Text('Talking'),
      ),
      NavigationRailDestination(
        icon: ref.watch(isWorkingVoiceOnProvider)
            ? const Icon(FontAwesomeIcons.check)
            : const Icon(FontAwesomeIcons.volumeLow),
        label: const Text('Working'),
      ),
      NavigationRailDestination(
        icon: ref.watch(isWhisperingOnProvider)
            ? const Icon(FontAwesomeIcons.check)
            : const Icon(FontAwesomeIcons.volumeOff),
        label: const Text('Whisper'),
      ),
      NavigationRailDestination(
        icon: ref.watch(isSilenceOnProvider)
            ? const Icon(FontAwesomeIcons.check)
            : const Icon(FontAwesomeIcons.volumeXmark),
        label: const Text('Silent'),
      ),
    ],
  );
}
