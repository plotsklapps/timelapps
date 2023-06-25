import 'package:timelapps/all_imports.dart';

// This navigationrail holds multiple options for the user to select.
// The user can select themeMode, themeColor, circleColor, font, minutes/
// seconds and show timer or not. All values are stored in their respective
// Riverpod providers.
NavigationRail buildDualNavigationRail(
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
      } else if (index == 6) {
        ref.read(isThemeLightProvider.notifier).state =
            !ref.watch(isThemeLightProvider);
      } else if (index == 7) {
        ref.read(isThemeGreenProvider.notifier).state =
            !ref.watch(isThemeGreenProvider);
      } else if (index == 8) {
        ref.read(isColorRedProvider.notifier).state =
            !ref.watch(isColorRedProvider);
      } else if (index == 9) {
        ref.read(isFontQuestrialProvider.notifier).state =
            !ref.watch(isFontQuestrialProvider);
      } else if (index == 10) {
        ref.read(isMinutesShownProvider.notifier).state =
            !ref.watch(isMinutesShownProvider);
      } else if (index == 11) {
        ref.read(isTimeShownProvider.notifier).state =
            !ref.watch(isTimeShownProvider);
      } else if (index == 12) {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      'Other options',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(FontAwesomeIcons.globe),
                    title: const Text('Language'),
                    onTap: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text('Other languages coming soon!'),
                        behavior: SnackBarBehavior.floating,
                        action: SnackBarAction(
                          label: 'OK',
                          onPressed: () {},
                        ),
                      ));
                    },
                  ),
                  ListTile(
                    leading: const Icon(FontAwesomeIcons.circleInfo),
                    title: const Text('About'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AboutScreen();
                          },
                        ),
                      );
                    },
                  ),
                ],
              );
            });
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
        icon: ref.watch(isTimeShownProvider)
            ? const Icon(FontAwesomeIcons.check)
            : const Icon(FontAwesomeIcons.xmark),
        label: const Text('Timer'),
      ),
      const NavigationRailDestination(
        icon: Icon(FontAwesomeIcons.gear),
        label: Text('Other'),
      ),
    ],
  );
}
