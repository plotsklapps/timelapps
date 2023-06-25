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
      body: Row(
        children: [
          ref.watch(isRunningProvider)
              ? const SizedBox()
              : buildNoiseNavigationRail(context, ref).animate().slideX(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeInOut),
          Expanded(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                // Get the max width and height of the available space
                double maxWidth = constraints.maxWidth;
                double maxHeight = constraints.maxHeight;
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
