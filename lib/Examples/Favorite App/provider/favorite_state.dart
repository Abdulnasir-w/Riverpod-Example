import 'package:riverpord_example/Examples/Favorite%20App/items.dart';

class FavoriteState {
  List<Items> allItems;
  List<Items> favoriteItems;
  String search;

  FavoriteState(
      {required this.allItems,
      required this.favoriteItems,
      required this.search});

  FavoriteState copyWith(
      {List<Items>? allItems, List<Items>? favoriteItems, String? search}) {
    return FavoriteState(
        allItems: allItems ?? this.allItems,
        favoriteItems: favoriteItems ?? this.favoriteItems,
        search: search ?? this.search);
  }
}
