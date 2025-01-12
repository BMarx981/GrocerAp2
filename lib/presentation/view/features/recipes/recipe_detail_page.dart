import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/data/source/database/database.dart';
import 'package:grocerapp/presentation/view/features/app_bar/app_bar.dart';
import 'package:grocerapp/presentation/view/features/lists/components/selected_items_list.dart';
import 'package:grocerapp/presentation/view/features/recipes/components/list_of_recipes_widget.dart';

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
              child:
                  ListOfRecipesWidget(listId: listData.id, name: listData.name),
            ),
            Expanded(
              child: ListOfSelectedItems(listId: listData.id),
            )
          ],
        ));
  }
}
