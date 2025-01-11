import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/application/bottom_nav_provider/bottom_nav_provider.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(bottomNavProvider.notifier);
    return BottomNavigationBar(
        backgroundColor: Colors.blueGrey.withValues(alpha: 0.2),
        selectedItemColor: Colors.amberAccent,
        currentIndex: index,
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
                  Beamer.of(context).beamToReplacementNamed('/dashboard');
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
                  Beamer.of(context).beamToReplacementNamed('/lists',
                      popToNamed: '/dashboard');
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
                  Beamer.of(context).beamToReplacementNamed('/recipes',
                      popToNamed: '/dashboard');
                },
              ),
            ),
            label: "Recipes",
          ),
        ]);
  }
}
