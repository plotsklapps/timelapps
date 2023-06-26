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
        ref.read(isOneOnProvider.notifier).state = !ref.watch(isOneOnProvider);
        ref.read(noiseNameProvider.notifier).state = noiseNamesList[0];
        ref.read(isTwoOnProvider.notifier).state = false;
        ref.read(isThreeOnProvider.notifier).state = false;
        ref.read(isFourOnProvider.notifier).state = false;
        ref.read(isFiveOnProvider.notifier).state = false;
        ref.read(isSixOnProvider.notifier).state = false;
        ref.read(isRedOnProvider.notifier).state = false;
        ref.read(isYellowOnProvider.notifier).state = false;
        ref.read(isGreenOnProvider.notifier).state = true;
      } else if (index == 1) {
        ref.read(isTwoOnProvider.notifier).state = !ref.watch(isTwoOnProvider);
        ref.read(noiseNameProvider.notifier).state = noiseNamesList[1];
        ref.read(isOneOnProvider.notifier).state = false;
        ref.read(isThreeOnProvider.notifier).state = false;
        ref.read(isFourOnProvider.notifier).state = false;
        ref.read(isFiveOnProvider.notifier).state = false;
        ref.read(isSixOnProvider.notifier).state = false;
        ref.read(isRedOnProvider.notifier).state = false;
        ref.read(isYellowOnProvider.notifier).state = false;
        ref.read(isGreenOnProvider.notifier).state = true;
      } else if (index == 2) {
        ref.read(isThreeOnProvider.notifier).state =
            !ref.watch(isThreeOnProvider);
        ref.read(noiseNameProvider.notifier).state = noiseNamesList[2];
        ref.read(isOneOnProvider.notifier).state = false;
        ref.read(isTwoOnProvider.notifier).state = false;
        ref.read(isOneOnProvider.notifier).state = false;
        ref.read(isFourOnProvider.notifier).state = false;
        ref.read(isFiveOnProvider.notifier).state = false;
        ref.read(isSixOnProvider.notifier).state = false;
        ref.read(isRedOnProvider.notifier).state = false;
        ref.read(isYellowOnProvider.notifier).state = false;
        ref.read(isGreenOnProvider.notifier).state = true;
      } else if (index == 3) {
        ref.read(isFourOnProvider.notifier).state =
            !ref.watch(isFourOnProvider);
        ref.read(noiseNameProvider.notifier).state = noiseNamesList[3];
        ref.read(isOneOnProvider.notifier).state = false;
        ref.read(isTwoOnProvider.notifier).state = false;
        ref.read(isThreeOnProvider.notifier).state = false;
        ref.read(isFiveOnProvider.notifier).state = false;
        ref.read(isSixOnProvider.notifier).state = false;
        ref.read(isRedOnProvider.notifier).state = false;
        ref.read(isYellowOnProvider.notifier).state = true;
        ref.read(isGreenOnProvider.notifier).state = false;
      } else if (index == 4) {
        ref.read(isFiveOnProvider.notifier).state =
            !ref.watch(isFiveOnProvider);
        ref.read(noiseNameProvider.notifier).state = noiseNamesList[4];
        ref.read(isOneOnProvider.notifier).state = false;
        ref.read(isTwoOnProvider.notifier).state = false;
        ref.read(isThreeOnProvider.notifier).state = false;
        ref.read(isFourOnProvider.notifier).state = false;
        ref.read(isSixOnProvider.notifier).state = false;
        ref.read(isRedOnProvider.notifier).state = false;
        ref.read(isYellowOnProvider.notifier).state = true;
        ref.read(isGreenOnProvider.notifier).state = false;
      } else if (index == 5) {
        ref.read(noiseNameProvider.notifier).state = noiseNamesList[5];
        ref.read(isSixOnProvider.notifier).state = !ref.watch(isSixOnProvider);
        ref.read(isOneOnProvider.notifier).state = false;
        ref.read(isTwoOnProvider.notifier).state = false;
        ref.read(isThreeOnProvider.notifier).state = false;
        ref.read(isFourOnProvider.notifier).state = false;
        ref.read(isFiveOnProvider.notifier).state = false;
        ref.read(isRedOnProvider.notifier).state = true;
        ref.read(isYellowOnProvider.notifier).state = false;
        ref.read(isGreenOnProvider.notifier).state = false;
      }
    },
    labelType: NavigationRailLabelType.all,
    destinations: <NavigationRailDestination>[
      NavigationRailDestination(
        icon: ref.watch(isOneOnProvider)
            ? const Icon(FontAwesomeIcons.check)
            : const Icon(FontAwesomeIcons.bullhorn),
        label: const Text('Outside'),
      ),
      NavigationRailDestination(
        icon: ref.watch(isTwoOnProvider)
            ? const Icon(FontAwesomeIcons.check)
            : const Icon(FontAwesomeIcons.personChalkboard),
        label: const Text('Presentation'),
      ),
      NavigationRailDestination(
        icon: ref.watch(isThreeOnProvider)
            ? const Icon(FontAwesomeIcons.check)
            : const Icon(FontAwesomeIcons.volumeHigh),
        label: const Text('Talking'),
      ),
      NavigationRailDestination(
        icon: ref.watch(isFourOnProvider)
            ? const Icon(FontAwesomeIcons.check)
            : const Icon(FontAwesomeIcons.volumeLow),
        label: const Text('Working'),
      ),
      NavigationRailDestination(
        icon: ref.watch(isFiveOnProvider)
            ? const Icon(FontAwesomeIcons.check)
            : const Icon(FontAwesomeIcons.volumeOff),
        label: const Text('Whisper'),
      ),
      NavigationRailDestination(
        icon: ref.watch(isSixOnProvider)
            ? const Icon(FontAwesomeIcons.check)
            : const Icon(FontAwesomeIcons.volumeXmark),
        label: const Text('Silent'),
      ),
    ],
  );
}
