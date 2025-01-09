class Items {
  String id;
  String name;
  bool isFavorite;

  Items({required this.id, required this.name, required this.isFavorite});

  Items copyWith({String? id, String? name, bool? isFavorite}) {
    return Items(
        id: id ?? this.id,
        name: name ?? this.name,
        isFavorite: isFavorite ?? this.isFavorite);
  }
}
