import 'dart:async';
import 'dart:math';

import 'package:timelapps/all_imports.dart';

import 'firebase_options.dart';

Future<void> main() async {
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
      theme: ref.watch(themeLightProvider),
      darkTheme: ref.watch(themeDarkProvider),
      themeMode: ref.watch(themeModeProvider),
      home: const HomeScreen(),
    );
  }
}
