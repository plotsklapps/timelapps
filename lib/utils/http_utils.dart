import 'package:timelapps/all_imports.dart';

class UtilsHttp {
  static final Uri plotsklappsWebsiteURL =
      Uri.parse('https://www.plotsklapps.dev');
  final Uri buyMeACoffeeURL =
      Uri.parse('https://www.buymeacoffee.com/plotsklapps');
  final Uri stripeURL = Uri.parse('https://buy.stripe.com/9AQbJy7lEdPQ9XOcMM');
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

  Future<void> launchStripe() async {
    if (!await launchUrl(stripeURL)) {
      throw Exception('Could not launch $stripeURL');
    }
  }

  Future<void> launchSourceCode() async {
    if (!await launchUrl(sourceCodeURL)) {
      throw Exception('Could not launch $sourceCodeURL');
    }
  }
}
