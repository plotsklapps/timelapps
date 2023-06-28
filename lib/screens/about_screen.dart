import 'package:timelapps/all_imports.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(
            onPressed: () async {
              await UtilsHttp().launchWebsite();
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(FontAwesomeIcons.houseChimney),
                SizedBox(width: 16),
                Text(UtilsString.kWebsite),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(
            onPressed: () async {
              await UtilsHttp().launchSourceCode();
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(FontAwesomeIcons.code),
                SizedBox(width: 16),
                Text(UtilsString.kSourceCode),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(
            onPressed: () async {
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
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(FontAwesomeIcons.heartCircleCheck),
                SizedBox(width: 16),
                Text(UtilsString.kDonate),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(FontAwesomeIcons.circleInfo),
                SizedBox(width: 16),
                Text(UtilsString.kAbout),
              ],
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
