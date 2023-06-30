import 'package:timelapps/all_imports.dart';

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({super.key});

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
