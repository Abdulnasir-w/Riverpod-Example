import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpord_example/Examples/Favorite%20App/provider/provider.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("Scaffold build");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Column(
          children: [
            Consumer(
              builder: (context, ref, child) {
                return TextField(
                  onChanged: (value) {
                    debugPrint("Search:");
                    ref.read(favoriteProvider.notifier).filter(value);
                  },
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: const Icon(Icons.search),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.deepOrange),
                    ),
                  ),
                );
              },
            ),
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  final favoriteState = ref.watch(favoriteProvider);
                  return ListView.builder(
                    itemCount: favoriteState.favoriteItems.length,
                    itemBuilder: (context, index) {
                      final item = favoriteState.favoriteItems[index];
                      return ListTile(
                        title: Text(item.name),
                        trailing: Icon(item.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("FloatActionButton");
          ref.read(favoriteProvider.notifier).addItem();
        },
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        tooltip: "Add Item",
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
