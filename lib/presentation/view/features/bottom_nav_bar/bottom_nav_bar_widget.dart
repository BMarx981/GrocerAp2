import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(items: [
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
              Beamer.of(context)
                  .beamToReplacementNamed('/lists', popToNamed: '/dashboard');
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
              Beamer.of(context)
                  .beamToReplacementNamed('/recipes', popToNamed: '/dashboard');
            },
          ),
        ),
        label: "Recipes",
      ),
    ]);
  }
}
