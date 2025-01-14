import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/domain/repository/lists_item_repository.dart';
import 'package:grocerapp/domain/repository/lists_repository.dart';

class ListOfSelectedItems extends ConsumerWidget {
  const ListOfSelectedItems({super.key, required this.listId});
  final int listId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref
        .watch(listsItemRepositoryProvider.notifier)
        .fetchGroceryItemsForList(listId);
    final notifier = ref.read(listsRepositoryProvider.notifier);
    return StreamBuilder(
      stream: provider,
      builder: (context, snapshot) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                return Dismissible(
                  onDismissed: (direction) =>
                      notifier.deleteItemFromShoppingList(
                          snapshot.requireData[index].id, listId),
                  key: UniqueKey(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(snapshot.requireData[index].name!),
                    ],
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
