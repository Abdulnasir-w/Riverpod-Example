import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpord_example/Examples/Favorite%20App/items.dart';
import 'package:riverpord_example/Examples/Favorite%20App/provider/favorite_state.dart';

final favoriteProvider = StateNotifierProvider<FavoriteNotifier, FavoriteState>(
    (ref) => FavoriteNotifier());

class FavoriteNotifier extends StateNotifier<FavoriteState> {
  FavoriteNotifier()
      : super(FavoriteState(allItems: [], favoriteItems: [], search: ''));

  void addItem() {
    List<Items> item = [
      Items(id: "1", name: "Syed Abdul Nasir", isFavorite: true),
      Items(id: "2", name: "Faris", isFavorite: false),
      Items(id: "3", name: "Anas", isFavorite: true),
      Items(id: "4", name: "Ishaq", isFavorite: false),
      Items(id: "5", name: "Abbas", isFavorite: true),
      Items(id: "6", name: "Faisal", isFavorite: false),
      Items(id: "7", name: "Qaisar", isFavorite: true),
      Items(id: "8", name: "Kamran", isFavorite: false),
      Items(id: "9", name: "Syed Izhar Ahmad", isFavorite: true),
      Items(id: "10", name: "Syed Muhammad Khalil", isFavorite: false),
    ];

    state = state.copyWith(
      allItems: item.toList(),
      favoriteItems: item.toList(),
    );
  }

  void filter(String search) {
    state = state.copyWith(favoriteItems: filterItems(state.allItems, search));
  }

  List<Items> filterItems(List<Items> items, String search) {
    if (search.isEmpty) {
      return items;
    }
    return items
        .where(
            (items) => items.name.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }
}
