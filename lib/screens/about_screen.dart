import 'package:timelapps/all_imports.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          ElevatedButton(
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
          )
              .animate()
              .fade(delay: 0.ms, duration: 1000.ms)
              .move(delay: 0.ms, duration: 1000.ms),
          const SizedBox(height: 8),
          ElevatedButton(
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
          )
              .animate()
              .fade(delay: 500.ms, duration: 1000.ms)
              .move(delay: 500.ms, duration: 1000.ms),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () async {
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
                          await UtilsHttp().launchStripe();
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
          )
              .animate()
              .fade(delay: 1000.ms, duration: 1000.ms)
              .move(delay: 1000.ms, duration: 1000.ms),
          const SizedBox(height: 8),
          ElevatedButton(
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
          )
              .animate()
              .fade(delay: 1500.ms, duration: 1000.ms)
              .move(delay: 1500.ms, duration: 1000.ms),
          const Divider(),
        ],
      ),
    );
  }
}
