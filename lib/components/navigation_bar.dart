import 'package:timelapps/all_imports.dart';

// NavigationBar is shown on all screens, providing easy navigation for
// the user.
NavigationBar buildNavigationBar(WidgetRef ref) {
  return NavigationBar(
    onDestinationSelected: (int index) {
      ref.read(currentPageIndexProvider.notifier).state = index;
    },
    selectedIndex: ref.watch(currentPageIndexProvider),
    destinations: const <Widget>[
      // UI code for the navigation rail. Checking the booleans which icon
      // to show.
      NavigationDestination(
        icon: Icon(FontAwesomeIcons.solidClock),
        selectedIcon: Icon(FontAwesomeIcons.check),
        label: 'TimeTimer',
      ),
      NavigationDestination(
        icon: Icon(FontAwesomeIcons.trafficLight),
        selectedIcon: Icon(FontAwesomeIcons.check),
        label: 'NoiseLight',
      ),
      NavigationDestination(
        icon: Icon(FontAwesomeIcons.solidClone),
        selectedIcon: Icon(FontAwesomeIcons.check),
        label: 'Both',
      ),
      NavigationDestination(
        icon: Icon(FontAwesomeIcons.circleInfo),
        selectedIcon: Icon(FontAwesomeIcons.check),
        label: 'About',
      ),
    ],
  );
}
