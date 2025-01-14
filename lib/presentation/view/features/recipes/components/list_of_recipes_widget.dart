import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/domain/repository/grocery_item_repository.dart';
import 'package:grocerapp/domain/repository/recipe_list_repository.dart';
import 'package:grocerapp/presentation/common_widgets/error_message_widget.dart';

class ListOfRecipesWidget extends ConsumerWidget {
  const ListOfRecipesWidget(
      {super.key, required this.listId, required this.name});
  final String name;
  final int listId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(groceryItemRepositoryProvider);
    return provider.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, stackTrace) => ErrorMessageWidget(e.toString()),
      data: (data) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
                  child: ElevatedButton(
                    child: Text(data[index].name!),
                    onPressed: () {
                      ref
                          .read(recipeListRepositoryProvider.notifier)
                          .addItemToRecipeList(data[index].id, listId);
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
