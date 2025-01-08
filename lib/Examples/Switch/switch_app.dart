import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final switchProv = StateProvider<bool>((ref) => false);

class SwitchApp extends ConsumerStatefulWidget {
  const SwitchApp({super.key});

  @override
  ConsumerState<SwitchApp> createState() => _SwitchAppState();
}

class _SwitchAppState extends ConsumerState<SwitchApp> {
  @override
  Widget build(BuildContext context) {
    debugPrint('build 1');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Switch App',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Consumer(
                builder: (context, ref, index) {
                  final isSwitchOn = ref.watch(switchProv);
                  debugPrint('build 2');
                  return Switch.adaptive(
                    value: isSwitchOn,
                    onChanged: (value) =>
                        ref.read(switchProv.notifier).state = value,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
