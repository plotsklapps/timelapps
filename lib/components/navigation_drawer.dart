import 'package:timelapps/all_imports.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Image.asset('assets/plotsklapps_logo_straight.png'),
          ),
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
              onTap: () async {
                await UtilsHttp().launchWebsite();
              }),
          ListTile(
            leading: const Icon(FontAwesomeIcons.code),
            title: const Text('Source code'),
            onTap: () async {
              await UtilsHttp().launchSourceCode();
            },
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.heartCircleCheck),
            title: const Text('Donate'),
            onTap: () async {
              await UtilsHttp().launchBuyMeACoffee();
            },
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.circleInfo),
            title: const Text('About'),
            onTap: () async {
              Navigator.pop(context);
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
