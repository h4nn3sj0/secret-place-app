import 'package:flutter/material.dart';
import 'package:slide_countdown/slide_countdown.dart';

class CustomSlideCountdown extends StatefulWidget {
  const CustomSlideCountdown({
    Key? key,
    required this.duration
    }) : super(key: key);

  final Duration duration;

  @override
  State<CustomSlideCountdown> createState() =>
      _CustomSlideCountdownState(duration: this.duration);
}

class _CustomSlideCountdownState extends State<CustomSlideCountdown> {
  _CustomSlideCountdownState({
    required this.duration
    }) : super();

  late final StreamDuration streamDuration;
  late final Duration duration;

  @override
  void initState() {
    streamDuration = StreamDuration(
      config: StreamDurationConfig(
        countDownConfig: CountDownConfig(duration: duration),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    streamDuration.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RawSlideCountdown(
              streamDuration: streamDuration,
              builder: (context, duration, countUp) {
                return Row(
                  children: [
                    RawDigitItem(
                      duration: duration,
                      timeUnit: TimeUnit.seconds,
                      digitType: DigitType.first,
                      countUp: countUp,
                    ),
                    RawDigitItem(
                      duration: duration,
                      timeUnit: TimeUnit.seconds,
                      digitType: DigitType.second,
                      countUp: countUp,
                    ),
                  ],
                );
              },
            );
  }
}