import 'package:timelapps/all_imports.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 680) {
          return const MobileScreen();
        } else if (constraints.maxWidth < 1200) {
          return const TabletScreen();
        } else {
          return const DesktopScreen();
        }
      },
    );
  }
}
