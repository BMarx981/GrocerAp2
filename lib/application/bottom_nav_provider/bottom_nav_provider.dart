import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_nav_provider.g.dart';

@riverpod
class BottomNav extends _$BottomNav {
  @override
  int build() {
    return 0;
  }

  void bottomNavSelected(int currentIndex) {
    state = currentIndex;
  }
}
