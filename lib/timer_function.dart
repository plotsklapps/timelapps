import 'dart:async';

import 'package:timelapps/all_imports.dart';

class TimerFunction {
  // WidgetRef ref grants access to Riverpod providers. The two timers are
  // being set from the UI.
  WidgetRef ref;
  Timer? minutesTimer;
  Timer? secondsTimer;

  TimerFunction(this.ref, minutesTimer, secondsTimer);

  void startTimer() {
    // First, set the 'Timer is running' boolean to true
    ref.read(isRunningProvider.notifier).state = true;

    // Second, check if the user wants to see minutes or seconds, then
    // start the corresponding timer. When the timer reaches 0, call
    // stopTimer() to stop the timer and reset the 'Timer is running' boolean.
    if (ref.watch(isMinutesShownProvider)) {
      minutesTimer = Timer.periodic(const Duration(minutes: 1), (_) {
        if (ref.watch(minutesProvider) > 1) {
          ref.read(minutesProvider.notifier).state--;
        } else {
          ref.read(secondsProvider.notifier).state = 0;
          stopTimer();
        }
      });
    } else {
      secondsTimer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (ref.watch(secondsProvider) > 1) {
          ref.read(secondsProvider.notifier).state--;
        } else {
          ref.read(secondsProvider.notifier).state = 0;
          stopTimer();
        }
      });
    }
  }

  void stopTimer() {
    // First, set the 'Timer is running' boolean to false
    ref.read(isRunningProvider.notifier).state = false;
    // Second, cancel the active timers.
    secondsTimer?.cancel();
    minutesTimer?.cancel();
  }
}
