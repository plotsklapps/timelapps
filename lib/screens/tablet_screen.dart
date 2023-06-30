import 'package:timelapps/all_imports.dart';

class TabletScreen extends StatelessWidget {
  const TabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // So simple.
    return const Scaffold(
      body: Center(
        child: PhoneContainer(
          child: MobileScreen(),
        ),
      ),
    );
  }
}
