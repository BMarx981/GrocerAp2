import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_provider.g.dart';

@riverpod
class Recipe extends _$Recipe {
  @override
  bool build() {
    return false;
  }

  void toggleTextField() {
    state = !state;
  }
}