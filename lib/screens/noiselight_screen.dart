import 'package:timelapps/all_imports.dart';

class NoiseLightScreen extends ConsumerStatefulWidget {
  const NoiseLightScreen({super.key});

  @override
  ConsumerState<NoiseLightScreen> createState() {
    return NoiseLightScreenState();
  }
}

class NoiseLightScreenState extends ConsumerState<NoiseLightScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          if (ref.watch(isRunningProvider))
            const SizedBox()
          else
            buildNoiseNavigationRail(context, ref).animate().slideX(
                begin: -1.0,
                end: 0.0,
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeInOut),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  ref.watch(noiseNameProvider),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      // Get the max width and height of the available space
                      final double maxWidth = constraints.maxWidth;
                      final double maxHeight = constraints.maxHeight;
                      return Center(
                        child: CustomPaint(
                          size: Size(maxHeight, maxWidth),
                          painter: TrafficLightPainter(
                            ref: ref,
                            redOn: ref.watch(isRedOnProvider),
                            yellowOn: ref.watch(isYellowOnProvider),
                            greenOn: ref.watch(isGreenOnProvider),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
