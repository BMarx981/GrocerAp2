import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecipeDetailsWidget extends ConsumerWidget {
  const RecipeDetailsWidget({super.key, required this.name});

  /// The name of the Recipe
  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: Container(
            key: const Key('recipe_detail_container'),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: Color.fromARGB(255, 17, 68, 109),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(name,
                    style: const TextStyle(color: Colors.white),
                    key: const Key('recipe_detail_name')),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
