import 'package:timelapps/all_imports.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Image.asset(UtilsString.kPlotsklappsLogoStraight),
            ),
          ),
          const Text(
            UtilsString.kTimelappsByPlotsklapps,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              UtilsString.kEnjoyedMakingIt,
              textAlign: TextAlign.center,
            ),
          ),
          const Divider(),
          ListTile(
              leading: const Icon(FontAwesomeIcons.houseChimney),
              title: const Text(UtilsString.kWebsite),
              onTap: () async {
                await UtilsHttp().launchWebsite();
              }),
          ListTile(
            leading: const Icon(FontAwesomeIcons.code),
            title: const Text(UtilsString.kSourceCode),
            onTap: () async {
              await UtilsHttp().launchSourceCode();
            },
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.heartCircleCheck),
            title: const Text(UtilsString.kDonate),
            onTap: () async {
              Navigator.pop(context);
              await showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text(UtilsString.kDonations),
                    content: const Text(
                      UtilsString.kDonationsPlease,
                    ),
                    actions: <Widget>[
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                        ),
                        child: const Text(UtilsString.kNotNow),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                        ),
                        child: const Text(UtilsString.kGreatIdea),
                        onPressed: () async {
                          await UtilsHttp().launchBuyMeACoffee();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.circleInfo),
            title: const Text(UtilsString.kAbout),
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
