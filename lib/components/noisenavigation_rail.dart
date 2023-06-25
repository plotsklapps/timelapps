import 'package:timelapps/all_imports.dart';

// This navigationrail holds multiple options for the user to select.
// The user can select themeMode, themeColor, circleColor, font, minutes/
// seconds and show timer or not. All values are stored in their respective
// Riverpod providers.
NavigationRail buildNoiseNavigationRail(
  BuildContext context,
  WidgetRef ref,
) {
  return NavigationRail(
    selectedIndex: 0,
    onDestinationSelected: (int index) {
      if (index == 0) {
        ref.read(isOneOnProvider.notifier).state = !ref.watch(isOneOnProvider);
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
        ref.read(isOneOnProvider.notifier).state = false;
        ref.read(isTwoOnProvider.notifier).state = false;
        ref.read(isThreeOnProvider.notifier).state = false;
        ref.read(isFourOnProvider.notifier).state = false;
        ref.read(isSixOnProvider.notifier).state = false;
        ref.read(isRedOnProvider.notifier).state = false;
        ref.read(isYellowOnProvider.notifier).state = true;
        ref.read(isGreenOnProvider.notifier).state = false;
      } else if (index == 5) {
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
            : const Icon(FontAwesomeIcons.one),
        label: const Text('ONE'),
      ),
      NavigationRailDestination(
        icon: ref.watch(isTwoOnProvider)
            ? const Icon(FontAwesomeIcons.check)
            : const Icon(FontAwesomeIcons.two),
        label: const Text('TWO'),
      ),
      NavigationRailDestination(
        icon: ref.watch(isThreeOnProvider)
            ? const Icon(FontAwesomeIcons.check)
            : const Icon(FontAwesomeIcons.three),
        label: const Text('THREE'),
      ),
      NavigationRailDestination(
        icon: ref.watch(isFourOnProvider)
            ? const Icon(FontAwesomeIcons.check)
            : const Icon(FontAwesomeIcons.four),
        label: const Text('FOUR'),
      ),
      NavigationRailDestination(
        icon: ref.watch(isFiveOnProvider)
            ? const Icon(FontAwesomeIcons.check)
            : const Icon(FontAwesomeIcons.five),
        label: const Text('FIVE'),
      ),
      NavigationRailDestination(
        icon: ref.watch(isSixOnProvider)
            ? const Icon(FontAwesomeIcons.check)
            : const Icon(FontAwesomeIcons.six),
        label: const Text('SIX'),
      ),
    ],
  );
}
