import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/data/source/database/database.dart';
import 'package:grocerapp/domain/repository/grocery_item_repository.dart';
import 'package:grocerapp/domain/repository/recipe_repository.dart';
import 'package:grocerapp/presentation/common_widgets/error_message_widget.dart';
import 'package:grocerapp/presentation/view/features/app_bar/app_bar.dart';

class RecipeDetailPage extends ConsumerWidget {
  const RecipeDetailPage({super.key, required this.listData});
  final RecipeData listData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: GrocerAppbar(title: "Add Items to ${listData.name}"),
        body: Column(
          children: [
            Expanded(
                child: ListOfRecipesWidget(
                    listId: listData.id, name: listData.name)),
            Expanded(
              child: ListOfSelectedItems(listId: listData.id),
            )
          ],
        ));
  }
}

class ListOfSelectedItems extends ConsumerWidget {
  const ListOfSelectedItems({super.key, required this.listId});
  final int listId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref
        .watch(recipeRepositoryProvider.notifier)
        .fetchGroceryItemsForRecipe(listId);
    return StreamBuilder(
        stream: provider,
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.grey.shade300),
              child: ListView.builder(
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Text(snapshot.requireData[index].name!);
                  }),
            ),
          );
        });
  }
}

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
              decoration: BoxDecoration(color: Colors.grey.shade300),
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
                      child: ElevatedButton(
                          child: Text(data[index].name!),
                          onPressed: () {
                            ref
                                .read(recipeRepositoryProvider.notifier)
                                .addItemToRecipeList(data[index].id, listId);
                          }),
                    );
                  }),
            ),
          );
        });
  }
}
