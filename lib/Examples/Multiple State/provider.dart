import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppState {
  final double slider;
  final bool showPassword;

  AppState({required this.slider, required this.showPassword});

  AppState copyWith({double? slider, bool? showPassword}) {
    return AppState(
      slider: slider ?? this.slider,
      showPassword: showPassword ?? this.showPassword,
    );
  }
}

final pro = StateProvider<AppState>((ref) {
  return AppState(slider: 0.0, showPassword: false);
});