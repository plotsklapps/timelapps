import 'package:timelapps/all_imports.dart';

class UtilsHttp {
  static final Uri plotsklappsWebsiteURL =
      Uri.parse('https://www.plotsklapps.dev');
  final Uri oneTimeDonationStripe =
      Uri.parse('https://buy.stripe.com/9AQbJy7lEdPQ9XOcMM');
  final Uri monthlySubscriptionStripe =
      Uri.parse('https://buy.stripe.com/aEU28Y8pIcLM3zq3cd');
  final Uri sourceCodeURL =
      Uri.parse('https://github.com/plotsklapps/timelapps');

  Future<void> launchWebsite() async {
    if (!await launchUrl(plotsklappsWebsiteURL)) {
      throw Exception('Could not launch $plotsklappsWebsiteURL');
    }
  }

  Future<void> launchOneTimeDonationStripe() async {
    if (!await launchUrl(oneTimeDonationStripe)) {
      throw Exception('Could not launch $oneTimeDonationStripe');
    }
  }

  Future<void> launchMonthlySubscriptionStripe() async {
    if (!await launchUrl(monthlySubscriptionStripe)) {
      throw Exception('Could not launch $monthlySubscriptionStripe');
    }
  }

  Future<void> launchSourceCode() async {
    if (!await launchUrl(sourceCodeURL)) {
      throw Exception('Could not launch $sourceCodeURL');
    }
  }
}
