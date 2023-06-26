import 'package:timelapps/all_imports.dart';

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: <Expanded>[
            Expanded(
              flex: 1,
              child: Center(
                  child: Image.asset('assets/plotsklapps_logo_stacked.png')),
            ),
            const Expanded(
              flex: 2,
              child: Center(
                child: PhoneContainer(
                  child: MobileScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
