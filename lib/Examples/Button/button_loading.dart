import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpord_example/Components/custom_button.dart';

class ButtonLoading extends ConsumerWidget {
  const ButtonLoading({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showLoading = ref.watch(loading);
    debugPrint('showLoading: $showLoading');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Loading'),
      ),
      body: Center(
        child: CustomButton(
          label: "Show Loading",
          isLoading: showLoading,
          onPressed: () async {
            if (showLoading) return; // Prevent multiple presses

            debugPrint('Starting loading operation...');
            ref.read(loading.notifier).state = true;

            await Future.delayed(const Duration(seconds: 4));

            ref.read(loading.notifier).state = false;
            debugPrint('Loading operation completed.');

            // Show snackbar after the operation completes
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Operation Completed!'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
