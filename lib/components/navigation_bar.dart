import 'package:timelapps/all_imports.dart';

NavigationBar buildNavigationBar(WidgetRef ref) {
  return NavigationBar(
    onDestinationSelected: (int index) {
      ref.read(currentPageIndexProvider.notifier).state = index;
    },
    selectedIndex: ref.watch(currentPageIndexProvider),
    destinations: const <Widget>[
      NavigationDestination(
        icon: Icon(FontAwesomeIcons.clock),
        selectedIcon: Icon(FontAwesomeIcons.check),
        label: 'TimeTimer',
      ),
      NavigationDestination(
        icon: Icon(FontAwesomeIcons.trafficLight),
        selectedIcon: Icon(FontAwesomeIcons.check),
        label: 'Noise',
      ),
      NavigationDestination(
        icon: Icon(FontAwesomeIcons.clone),
        selectedIcon: Icon(FontAwesomeIcons.check),
        label: 'Both',
      ),
      NavigationDestination(
        icon: Icon(FontAwesomeIcons.gear),
        selectedIcon: Icon(FontAwesomeIcons.check),
        label: 'More',
      ),
    ],
  );
}
