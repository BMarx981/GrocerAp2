import 'package:flutter/material.dart';
import 'package:grocerapp/application/recipe_provider/recipe_provider.dart';
import 'package:grocerapp/domain/repository/recipe_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/presentation/common_widgets/textformfield_widget.dart';

class TextfieldButton extends ConsumerWidget {
  const TextfieldButton(
      {super.key, required this.controller, required this.buttonText});

  /// The controller that the textfield uses to take text input.
  final TextEditingController controller;

  /// The text for the button
  final String buttonText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeNotifier = ref.watch(recipeProvider);
    return Column(
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
                      onPressed: () =>
                          ref.read(recipeProvider.notifier).toggleTextField(),
                      child: Text(buttonText)),
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: recipeNotifier,
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
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
                      child: Stack(
                        alignment: AlignmentDirectional.centerEnd,
                        children: [
                          CustomTextformField(
                            label: "Recipe name",
                            controller: controller,
                          ),
                          Positioned(
                            child: IconButton(
                                onPressed: () {
                                  ref
                                      .read(recipeRepositoryProvider.notifier)
                                      .addRecipe(controller.text);
                                  ref
                                      .read(recipeProvider.notifier)
                                      .toggleTextField();
                                  controller.clear();
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
      ],
    );
  }
}
