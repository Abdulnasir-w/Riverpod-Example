import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sliderValue = StateProvider<double>((ref) => 0.0);

class SliderApp extends ConsumerWidget {
  const SliderApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('build 1');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Slider App',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 9),
        child: Column(
          children: [
            Consumer(builder: (context, ref, child) {
              final sliderValueState = ref.watch(sliderValue);
              debugPrint('build 2');

              return Container(
                width: 200,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.deepOrange.withOpacity(sliderValueState),
                ),
              );
            }),
            Consumer(builder: (context, ref, index) {
              debugPrint('build 3');
              final sliderValueState = ref.watch(sliderValue);
              return Slider.adaptive(
                value: sliderValueState,
                onChanged: (value) {
                  ref.read(sliderValue.notifier).state = value;
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
