import 'package:timelapps/all_imports.dart';

// The dual navigation rail goes with the dual screen!
// This dual navigationrail holds multiple options for the user to select.
// The user can select all soundlevels, themeMode, themeColor, circleColor,
// font, minutes/ seconds, bell sound and show timer or not. All values are
// stored in their respective Riverpod providers.
NavigationRail buildDualNavigationRail(
  BuildContext context,
  WidgetRef ref,
) {
  return NavigationRail(
    selectedIndex: ref.watch(selectedDualRailIndexProvider),
    onDestinationSelected: (int index) async {
      ref.read(selectedDualRailIndexProvider.notifier).state = index;
      if (index == 0) {
        // User selects Outside Voice, turn this boolean to true and the rest
        // to false. Also change the noiseNameProvider to the correct name.
        // Lastly, change the trafficlight to the correct color.
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
        // User selects Presentation Voice, turn this boolean to true and the
        // rest to false. Also change the noiseNameProvider to the correct name.
        // Lastly, change the trafficlight to the correct color.
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
        // User selects Talking Voice, turn this boolean to true and the rest
        // to false. Also change the noiseNameProvider to the correct name.
        // Lastly, change the trafficlight to the correct color.
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
        // User selects Working Voice, turn this boolean to true and the rest
        // to false. Also change the noiseNameProvider to the correct name.
        // Lastly, change the trafficlight to the correct color.
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
        // User selects Whispering, turn this boolean to true and the rest
        // to false. Also change the noiseNameProvider to the correct name.
        // Lastly, change the trafficlight to the correct color.
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
        // User selects Silence, turn this boolean to true and the rest
        // to false. Also change the noiseNameProvider to the correct name.
        // Lastly, change the trafficlight to the correct color.
        ref.read(isSilenceOnProvider.notifier).state =
            !ref.watch(isSilenceOnProvider);
        ref.read(noiseNameProvider.notifier).state = noiseNamesList[5];
        ref.read(isOutsideVoiceOnProvider.notifier).state = false;
        ref.read(isPresentationVoiceOnProvider.notifier).state = false;
        ref.read(isTalkingVoiceOnProvider.notifier).state = false;
        ref.read(isWorkingVoiceOnProvider.notifier).state = false;
        ref.read(isWhisperingOnProvider.notifier).state = false;
        ref.read(isRedOnProvider.notifier).state = true;
        ref.read(isYellowOnProvider.notifier).state = false;
        ref.read(isGreenOnProvider.notifier).state = false;
      } else if (index == 6) {
        // User selects the ThemeMode here (light or dark).
        ref.read(isThemeLightProvider.notifier).state =
            !ref.watch(isThemeLightProvider);
      } else if (index == 7) {
        // User selects the ThemeColor here (red or green).
        ref.read(isThemeGreenProvider.notifier).state =
            !ref.watch(isThemeGreenProvider);
      } else if (index == 8) {
        // User selects the timercolor here (red or green).
        ref.read(isColorRedProvider.notifier).state =
            !ref.watch(isColorRedProvider);
      } else if (index == 9) {
        // User selects the font here (questrial or bebasneue).
        ref.read(isFontQuestrialProvider.notifier).state =
            !ref.watch(isFontQuestrialProvider);
      } else if (index == 10) {
        // User selects the duration here (minutes or seconds).
        ref.read(isMinutesShownProvider.notifier).state =
            !ref.watch(isMinutesShownProvider);
      } else if (index == 11) {
        // User selects the bellsound here (bike or reception).
        ref.read(isBikeBellProvider.notifier).state =
            !ref.watch(isBikeBellProvider);
      } else if (index == 12) {
        // User selects whether to show the remaining time or not.
        ref.read(isTimeShownProvider.notifier).state =
            !ref.watch(isTimeShownProvider);
      }
    },
    labelType: NavigationRailLabelType.all,
    destinations: <NavigationRailDestination>[
      // UI code for the navigation rail. Checking the booleans which icon
      // to show.
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
        label: const Text('Silence'),
      ),
      NavigationRailDestination(
        icon: ref.watch(isThemeLightProvider)
            ? const Icon(FontAwesomeIcons.sun)
            : const Icon(FontAwesomeIcons.moon),
        label: const Text('Mode'),
      ),
      NavigationRailDestination(
        icon: ref.watch(isThemeGreenProvider)
            ? const Icon(FontAwesomeIcons.tree)
            : const Icon(FontAwesomeIcons.wineGlass),
        label: const Text('Theme'),
      ),
      NavigationRailDestination(
        icon: ref.watch(isColorRedProvider)
            ? const Icon(FontAwesomeIcons.solidHeart)
            : const Icon(FontAwesomeIcons.leaf),
        label: const Text('Color'),
      ),
      NavigationRailDestination(
        icon: ref.watch(isFontQuestrialProvider)
            ? const Icon(FontAwesomeIcons.quora)
            : const Icon(FontAwesomeIcons.bold),
        label: const Text('Font'),
      ),
      NavigationRailDestination(
        icon: ref.watch(isMinutesShownProvider)
            ? const Icon(FontAwesomeIcons.m)
            : const Icon(FontAwesomeIcons.s),
        label: const Text('Duration'),
      ),
      NavigationRailDestination(
        icon: ref.watch(isBikeBellProvider)
            ? const Icon(FontAwesomeIcons.bicycle)
            : const Icon(FontAwesomeIcons.bellConcierge),
        label: const Text('Bell'),
      ),
      NavigationRailDestination(
        icon: ref.watch(isTimeShownProvider)
            ? const Icon(FontAwesomeIcons.check)
            : const Icon(FontAwesomeIcons.xmark),
        label: const Text('Timer'),
      ),
    ],
  );
}
