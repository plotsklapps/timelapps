import 'package:timelapps/all_imports.dart';

NavigationBar buildNavigationBar(WidgetRef ref) {
  return NavigationBar(
    onDestinationSelected: (int index) {
      ref.read(currentPageIndexProvider.notifier).state = index;
    },
    selectedIndex: ref.watch(currentPageIndexProvider),
    destinations: const <Widget>[
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
    ],
  );
}
