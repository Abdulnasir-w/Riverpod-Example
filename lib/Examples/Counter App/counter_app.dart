import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counter = StateProvider<int>((ref) => 0);

final switchProv = StateProvider<bool>((ref) => false);

class CounterApp extends ConsumerWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('build 2');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counter App',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the button this many times:',
            ),
            const SizedBox(height: 16.0),
            Consumer(
              builder: (context, ref, child) {
                final count = ref.watch(counter);
                debugPrint('build 2');
                return Text(
                  '$count',
                  style: Theme.of(context).textTheme.displayLarge,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('Incrementing counter');
          ref.read(counter.notifier).state++;
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
