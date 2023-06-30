import 'package:timelapps/all_imports.dart';

// This navigationrail holds multiple options for the user to select.
// The user can select themeMode, themeColor, circleColor, font, minutes/
// seconds and show timer or not. All values are stored in their respective
// Riverpod providers.
NavigationRail buildTimerNavigationRail(
  BuildContext context,
  WidgetRef ref,
) {
  return NavigationRail(
    selectedIndex: ref.watch(selectedTimerRailIndexProvider),
    onDestinationSelected: (int index) async {
      ref.read(selectedTimerRailIndexProvider.notifier).state = index;
      if (index == 0) {
        // User selects the ThemeMode here (light or dark).
        ref.read(isThemeLightProvider.notifier).state =
            !ref.watch(isThemeLightProvider);
      } else if (index == 1) {
        // User selects the ThemeColor here (red or green).
        ref.read(isThemeGreenProvider.notifier).state =
            !ref.watch(isThemeGreenProvider);
      } else if (index == 2) {
        // User selects the timercolor here (red or green).
        ref.read(isColorRedProvider.notifier).state =
            !ref.watch(isColorRedProvider);
      } else if (index == 3) {
        // User selects the font here (questrial or bebasneue).
        ref.read(isFontQuestrialProvider.notifier).state =
            !ref.watch(isFontQuestrialProvider);
      } else if (index == 4) {
        // User selects the duration here (minutes or seconds).
        ref.read(isMinutesShownProvider.notifier).state =
            !ref.watch(isMinutesShownProvider);
      } else if (index == 5) {
        // User selects the bellsound here (bike or reception).
        ref.read(isBikeBellProvider.notifier).state =
            !ref.watch(isBikeBellProvider);
      } else if (index == 6) {
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
