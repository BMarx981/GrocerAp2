import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/application/bottom_nav_provider/bottom_nav_provider.dart';
import 'package:grocerapp/application/recipe_provider/recipe_provider.dart';
import 'package:grocerapp/domain/repository/recipe_repository.dart';
import 'package:grocerapp/presentation/common_widgets/textformfield_widget.dart';
import 'package:grocerapp/presentation/view/features/app_bar/app_bar.dart';
import 'package:grocerapp/presentation/view/features/bottom_nav_bar/bottom_nav_bar_widget.dart';
import 'package:grocerapp/presentation/view/features/recipes/recipe_list_widget.dart';

class RecipesPage extends ConsumerWidget {
  RecipesPage({super.key});
  final newRecipeController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);
    final recipeNotifer = ref.watch(recipeProvider);
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
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ElevatedButton(
                                onPressed: () => ref
                                    .read(recipeProvider.notifier)
                                    .toggleTextField(),
                                child: const Text("Add new recipe.")),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: recipeNotifer,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 4, 8),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: Colors.black45)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 0, 24, 8),
                                child: Stack(
                                  alignment: AlignmentDirectional.centerEnd,
                                  children: [
                                    CustomTextformField(
                                      label: "Recipe name",
                                      controller: newRecipeController,
                                    ),
                                    Positioned(
                                      child: IconButton(
                                          onPressed: () {
                                            ref
                                                .read(recipeRepositoryProvider
                                                    .notifier)
                                                .addRecipe(
                                                    newRecipeController.text);
                                            ref
                                                .read(recipeProvider.notifier)
                                                .toggleTextField();
                                            newRecipeController.clear();
                                          },
                                          icon: const Icon(
                                            Icons.add,
                                            color: Colors.black,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
