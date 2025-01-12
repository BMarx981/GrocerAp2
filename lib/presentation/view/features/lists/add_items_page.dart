import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/data/source/database/database.dart';
import 'package:grocerapp/presentation/view/features/app_bar/app_bar.dart';
import 'package:grocerapp/presentation/view/features/lists/components/available_items_list.dart';
import 'package:grocerapp/presentation/view/features/lists/components/selected_items_list.dart';

class AddItemsPage extends ConsumerWidget {
  const AddItemsPage({super.key, required this.listData});
  final ShoppingListData listData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: GrocerAppbar(title: "Add Items to ${listData.name}"),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Add these grocery items to your list.")],
              ),
            ),
            Expanded(
                child: ListOfItemsWidget(
                    listId: listData.id, name: listData.name)),
            Expanded(
              child: ListOfSelectedItems(listId: listData.id),
            )
          ],
        ));
  }
}
