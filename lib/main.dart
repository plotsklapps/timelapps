import 'package:timelapps/all_imports.dart';

// Run the app, but first, ensure that Firebase is initialized.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MainEntry()));
}

class MainEntry extends ConsumerWidget {
  const MainEntry({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Timelapps',
      // Get the theme data from their respective providers.
      theme: ref.watch(themeLightProvider),
      darkTheme: ref.watch(themeDarkProvider),
      themeMode: ref.watch(themeModeProvider),
      // Set the home to the ResponsiveLayout widget so it can decide which
      // screen to show.
      home: const ResponsiveLayout(),
    );
  }
}
