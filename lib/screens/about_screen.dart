import 'package:timelapps/all_imports.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({super.key});

  final Uri plotsklappsWebsiteURL = Uri.parse('https://www.plotsklapps.dev');
  final Uri buyMeACoffeeURL =
      Uri.parse('https://www.buymeacoffee.com/plotsklapps');
  final Uri sourceCodeURL =
      Uri.parse('https://github.com/plotsklapps/timelapps');

  Future<void> launchWebsite() async {
    if (!await launchUrl(plotsklappsWebsiteURL)) {
      throw Exception('Could not launch $plotsklappsWebsiteURL');
    }
  }

  Future<void> launchBuyMeACoffee() async {
    if (!await launchUrl(buyMeACoffeeURL)) {
      throw Exception('Could not launch $buyMeACoffeeURL');
    }
  }

  Future<void> launchSourceCode() async {
    if (!await launchUrl(sourceCodeURL)) {
      throw Exception('Could not launch $sourceCodeURL');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/plotsklapps_logo_straight.png'),
              const Divider(),
              const Text(
                'TIMELAPPS by PLOTSKLAPPS',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(),
              const Text(
                '''
This app is made with :heart: with Flutter & Dart. It is 100% open source and free forever. I hope you enjoy using this app as much as I enjoyed making it!''',
                textAlign: TextAlign.center,
              ),
              const Divider(),
              ListTile(
                leading: const Icon(FontAwesomeIcons.houseChimney),
                title: const Text('Website'),
                onTap: launchWebsite,
              ),
              ListTile(
                leading: const Icon(FontAwesomeIcons.code),
                title: const Text('Source code'),
                onTap: launchSourceCode,
              ),
              ListTile(
                leading: const Icon(FontAwesomeIcons.heartCircleCheck),
                title: const Text('Donate'),
                onTap: launchBuyMeACoffee,
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
