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
      const NavigationRailDestination(
        icon: Icon(Icons.settings),
        selectedIcon: Icon(Icons.settings),
        label: Text('Settings'),
      ),
    ],
  );
}
