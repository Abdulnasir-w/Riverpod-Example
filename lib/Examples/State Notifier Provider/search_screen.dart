import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpord_example/Examples/State%20Notifier%20Provider/search_provider.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          spacing: 15,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: outlineInputBorder,
                focusedBorder: outlineInputBorder,
                enabled: true,
              ),
              onChanged: (value) {
                ref.read(searchPro.notifier).search(value);
              },
            ),
            Consumer(builder: (context, ref, child) {
              final search = ref.watch(searchPro);
              return Text(
                search.search,
                style: TextStyle(fontSize: 27.0),
              );
            })
          ],
        ),
      ),
    );
  }
}
