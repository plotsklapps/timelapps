import 'package:timelapps/all_imports.dart';

Uri buyMeACoffeeURL = Uri.parse('https://www.buymeacoffee.com/plotsklapps');
Uri sourceCodeURL = Uri.parse('https://github.com/plotsklapps/timelapps');

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

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
        appBar: AppBar(
          title: const Text('ABOUT'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
This app is made with :heart: by PLOTSKLAPPS with Flutter & Dart. It is 100% open source and free forever. We hope you enjoy using this app as much as we enjoyed making it!''',
                textAlign: TextAlign.center,
              ),
              const Divider(),
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
