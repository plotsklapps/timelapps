import 'package:timelapps/all_imports.dart';

NavigationRail buildNavigationRail(WidgetRef ref) {
  return NavigationRail(
    selectedIndex: 0,
    onDestinationSelected: (int index) {
      if (index == 0) {
        ref.read(isThemeLightProvider.notifier).state =
            !ref.watch(isThemeLightProvider);
      } else if (index == 1) {
        ref.read(isThemeGreenProvider.notifier).state =
            !ref.watch(isThemeGreenProvider);
      } else if (index == 2) {
        ref.read(isFontQuestrialProvider.notifier).state =
            !ref.watch(isFontQuestrialProvider);
      } else if (index == 3) {
        ref.read(isMinutesShownProvider.notifier).state =
            !ref.watch(isMinutesShownProvider);
      } else if (index == 4) {
        ref.read(isTimeShownProvider.notifier).state =
            !ref.watch(isTimeShownProvider);
      }
    },
    labelType: NavigationRailLabelType.all,
    destinations: <NavigationRailDestination>[
      NavigationRailDestination(
        icon: ref.watch(isThemeLightProvider)
            ? const Icon(Icons.light_mode)
            : const Icon(Icons.dark_mode),
        label: const Text('Theme'),
      ),
      NavigationRailDestination(
        icon: ref.watch(isThemeGreenProvider)
            ? const Icon(Icons.forest)
            : const Icon(Icons.wine_bar),
        label: const Text('Color'),
      ),
      NavigationRailDestination(
        icon: ref.watch(isFontQuestrialProvider)
            ? const Icon(Icons.quora)
            : const Icon(Icons.format_bold),
        label: const Text('Font'),
      ),
      NavigationRailDestination(
        icon: ref.watch(isMinutesShownProvider)
            ? const Icon(Icons.check_circle)
            : const Icon(Icons.remove_circle),
        label: const Text('Duration'),
      ),
      NavigationRailDestination(
        icon: ref.watch(isTimeShownProvider)
            ? const Icon(Icons.check_circle)
            : const Icon(Icons.remove_circle),
        label: const Text('Timer'),
      ),
    ],
  );
}
