import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/application/bottom_nav_provider/bottom_nav_provider.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(bottomNavProvider);
    final notifier = ref.watch(bottomNavProvider.notifier);
    return BottomNavigationBar(
        backgroundColor: Colors.blueGrey.withValues(alpha: 0.2),
        selectedItemColor: Colors.amberAccent,
        currentIndex: provider,
        items: [
          BottomNavigationBarItem(
            icon: Semantics(
              label: 'Dashboard button',
              hint: 'Tap this button to navigate to the dashboard',
              child: IconButton(
                key: const Key('bottomnav_lists_button'),
                splashColor: null,
                hoverColor: null,
                icon: const Icon(Icons.home),
                onPressed: () {
                  notifier.bottomNavSelected(0);
                },
              ),
            ),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Semantics(
              label: 'Shopping list button',
              hint: 'Tap this button to navigate to the shopping list page',
              child: IconButton(
                key: const Key('bottomnav_lists_button'),
                icon: const Icon(Icons.list),
                onPressed: () {
                  notifier.bottomNavSelected(1);
                },
              ),
            ),
            label: "Lists",
          ),
          BottomNavigationBarItem(
            icon: Semantics(
              label: 'Recipe button',
              hint: 'Tap this button to navigate to the recipes page',
              child: IconButton(
                key: const Key('bottomnav_recipes_button'),
                icon: const Icon(Icons.book),
                onPressed: () {
                  notifier.bottomNavSelected(2);
                },
              ),
            ),
            label: "Recipes",
          ),
        ]);
  }
}
