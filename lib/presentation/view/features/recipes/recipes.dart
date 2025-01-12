import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/application/bottom_nav_provider/bottom_nav_provider.dart';
import 'package:grocerapp/presentation/view/features/app_bar/app_bar.dart';
import 'package:grocerapp/presentation/view/features/bottom_nav_bar/bottom_nav_bar_widget.dart';
import 'package:grocerapp/presentation/view/features/recipes/components/recipe_textfield_button.dart';
import 'package:grocerapp/presentation/view/features/recipes/components/recipe_list_widget.dart';

class RecipesPage extends ConsumerWidget {
  RecipesPage({super.key});
  final newRecipeController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);
    return Scaffold(
      appBar: const GrocerAppbar(
        title: "Recipes",
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(color: Colors.lightBlue),
              child: Column(
                children: [
                  TextfieldButton(
                    controller: newRecipeController,
                    buttonText: "Add new recipe.",
                  ),
                  const Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              RecipeListWidget(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(index: currentIndex),
    );
  }
}
