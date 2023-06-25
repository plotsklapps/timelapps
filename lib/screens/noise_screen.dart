import 'package:timelapps/all_imports.dart';

class NoiseScreen extends ConsumerStatefulWidget {
  const NoiseScreen({super.key});

  @override
  ConsumerState<NoiseScreen> createState() {
    return NoiseScreenState();
  }
}

class NoiseScreenState extends ConsumerState<NoiseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          if (ref.watch(isRunningProvider))
            const SizedBox()
          else
            buildNoiseNavigationRail(context, ref).animate().slideX(
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeInOut),
          Expanded(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                // Get the max width and height of the available space
                final double maxWidth = constraints.maxWidth;
                final double maxHeight = constraints.maxHeight;
                return Center(
                  child: CustomPaint(
                    size: Size(maxHeight, maxWidth),
                    painter: TrafficLightPainter(
                      redOn: ref.watch(isRedOnProvider),
                      yellowOn: ref.watch(isYellowOnProvider),
                      greenOn: ref.watch(isGreenOnProvider),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
