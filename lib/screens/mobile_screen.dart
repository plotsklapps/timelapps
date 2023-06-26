import 'package:timelapps/all_imports.dart';

// HomeScreen is nothing else than just a Scaffold showing a NavigationBar
// IF the 'Timer is running' boolean is false. Rest of the content is shown via
// the currentPageIndexProvider.
class MobileScreen extends ConsumerWidget {
  const MobileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: <Widget>[
          const TimeTimerScreen(),
          const NoiseScreen(),
          const DualScreen(),
          AboutScreen(),
        ][ref.watch(currentPageIndexProvider)],
        // Only show the navigation bar when the timer is NOT running
        bottomNavigationBar: ref.watch(isRunningProvider)
            ? const SizedBox()
            : buildNavigationBar(ref).animate().slideX(
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeInOut),
      ),
    );
  }
}
