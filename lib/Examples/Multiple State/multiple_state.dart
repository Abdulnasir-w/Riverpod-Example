import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpord_example/Examples/Multiple%20State/provider.dart';

class MultipleState extends ConsumerWidget {
  const MultipleState({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('build 1');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Multiple State',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 9),
        child: Column(
          children: [
            Consumer(builder: (context, ref, child) {
              final sliderValueState =
                  ref.watch(pro.select((state) => state.slider));
              debugPrint('build s');
              return Container(
                width: 200,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.deepOrange.withAlpha(sliderValueState.toInt()),
                ),
              );
            }),
            Consumer(
              builder: (context, ref, index) {
                debugPrint('build 3');
                final sliderValueState =
                    ref.watch(pro.select((state) => state.slider));
                return Slider.adaptive(
                  value: sliderValueState,
                  onChanged: (value) {
                    final state = ref.read(pro.notifier);
                    state.state = state.state.copyWith(slider: value);
                  },
                );
              },
            ),
            Consumer(
              builder: (context, ref, index) {
                debugPrint('build 5');
                final show =
                    ref.watch(pro.select((state) => state.showPassword));
                return IconButton(
                    onPressed: () {
                      final state = ref.read(pro.notifier);
                      state.state = state.state.copyWith(showPassword: !show);
                    },
                    icon: Icon(show ? Icons.visibility : Icons.visibility_off));
              },
            )
          ],
        ),
      ),
    );
  }
}
