import 'package:timelapps/all_imports.dart';

class NoiseScreen extends ConsumerStatefulWidget {
  const NoiseScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<NoiseScreen> createState() {
    return NoiseScreenState();
  }
}

class NoiseScreenState extends ConsumerState<NoiseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    onTap: () {
                      ref.read(isRedOnProvider.notifier).state = false;
                      ref.read(isYellowOnProvider.notifier).state = false;
                      ref.read(isGreenOnProvider.notifier).state = true;
                    },
                    leading: Icon(FontAwesomeIcons.one),
                    title: Text('Outside voice'),
                    tileColor: Colors.blue,
                    selectedTileColor: Colors.purple,
                  ),
                  ListTile(
                    onTap: () {
                      ref.read(isRedOnProvider.notifier).state = false;
                      ref.read(isYellowOnProvider.notifier).state = false;
                      ref.read(isGreenOnProvider.notifier).state = true;
                    },
                    leading: Icon(FontAwesomeIcons.two),
                    title: Text('Presentation voice'),
                    tileColor: Colors.blueAccent,
                    selectedTileColor: Colors.purple,
                  ),
                  ListTile(
                    onTap: () {
                      ref.read(isRedOnProvider.notifier).state = false;
                      ref.read(isYellowOnProvider.notifier).state = false;
                      ref.read(isGreenOnProvider.notifier).state = true;
                    },
                    leading: Icon(FontAwesomeIcons.three),
                    title: Text('Talking voice'),
                    tileColor: Colors.green,
                    selectedTileColor: Colors.purple,
                  ),
                  ListTile(
                    onTap: () {
                      ref.read(isRedOnProvider.notifier).state = false;
                      ref.read(isYellowOnProvider.notifier).state = true;
                      ref.read(isGreenOnProvider.notifier).state = false;
                    },
                    leading: Icon(FontAwesomeIcons.four),
                    title: Text('Group voice'),
                    tileColor: Colors.yellow,
                    selectedTileColor: Colors.purple,
                  ),
                  ListTile(
                    onTap: () {
                      ref.read(isRedOnProvider.notifier).state = false;
                      ref.read(isYellowOnProvider.notifier).state = true;
                      ref.read(isGreenOnProvider.notifier).state = false;
                    },
                    leading: Icon(FontAwesomeIcons.five),
                    title: Text('Whisper sound'),
                    tileColor: Colors.orange,
                    selectedTileColor: Colors.purple,
                  ),
                  ListTile(
                    onTap: () {
                      ref.read(isRedOnProvider.notifier).state = true;
                      ref.read(isYellowOnProvider.notifier).state = false;
                      ref.read(isGreenOnProvider.notifier).state = false;
                    },
                    leading: Icon(FontAwesomeIcons.six),
                    title: Text('Silence'),
                    tileColor: Colors.red,
                    selectedTileColor: Colors.purple,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomPaint(
                    painter: TrafficLightPainter(
                      redOn: ref.watch(isRedOnProvider),
                      yellowOn: ref.watch(isYellowOnProvider),
                      greenOn: ref.watch(isGreenOnProvider),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
