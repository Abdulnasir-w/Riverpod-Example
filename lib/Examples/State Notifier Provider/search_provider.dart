import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchPro = StateNotifierProvider<SearchNotifier, SearchState>(
    (ref) => SearchNotifier());

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier() : super(SearchState(search: ""));

  void search(String query) {
    state = state.copyWith(search: query);
  }
}

class SearchState {
  final String search;

  SearchState({required this.search});

  SearchState copyWith({String? search}) {
    return SearchState(
      search: search ?? this.search,
    );
  }
}
