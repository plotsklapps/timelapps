import 'package:timelapps/all_imports.dart';

// Use this class to launch URLs in the app.

class UtilsHttp {
  static final Uri plotsklappsWebsiteURL =
      Uri.parse('https://www.plotsklapps.dev');
  final Uri oneTimeDonationStripe =
      Uri.parse('https://buy.stripe.com/9AQbJy7lEdPQ9XOcMM');
  final Uri monthlySubscriptionStripe =
      Uri.parse('https://buy.stripe.com/aEU28Y8pIcLM3zq3cd');
  final Uri sourceCodeURL =
      Uri.parse('https://github.com/plotsklapps/timelapps');
  final Uri flutterRiverpodURL =
      Uri.parse('https://pub.dev/packages/flutter_riverpod');
  final Uri flexColorSchemeURL =
      Uri.parse('https://pub.dev/packages/flex_color_scheme');
  final Uri flutterAnimateURL =
      Uri.parse('https://pub.dev/packages/flutter_animate');
  final Uri justAudioURL = Uri.parse('https://pub.dev/packages/just_audio');

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

  Future<void> launchFlutterRiverpod() async {
    if (!await launchUrl(flutterRiverpodURL)) {
      throw Exception('Could not launch $flutterRiverpodURL');
    }
  }

  Future<void> launchFlexColorScheme() async {
    if (!await launchUrl(flexColorSchemeURL)) {
      throw Exception('Could not launch $flexColorSchemeURL');
    }
  }

  Future<void> launchFlutterAnimate() async {
    if (!await launchUrl(flutterAnimateURL)) {
      throw Exception('Could not launch $flutterAnimateURL');
    }
  }

  Future<void> launchJustAudio() async {
    if (!await launchUrl(justAudioURL)) {
      throw Exception('Could not launch $justAudioURL');
    }
  }
}
