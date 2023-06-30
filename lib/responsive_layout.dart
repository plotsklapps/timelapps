import 'package:timelapps/all_imports.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // If the width is more than 1200 then show desktop screen,
        // less or equal to 1200 and more than 680 show tablet screen,
        // less or equal to 680 show the mobile screen.
        if (constraints.maxWidth <= 680) {
          return const MobileScreen();
        } else if (constraints.maxWidth <= 1200) {
          return const TabletScreen();
        } else {
          return const DesktopScreen();
        }
      },
    );
  }
}
