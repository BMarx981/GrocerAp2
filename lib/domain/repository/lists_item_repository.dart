import 'package:drift/drift.dart';
import 'package:grocerapp/data/source/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lists_item_repository.g.dart';

@riverpod
class ListsItemRepository extends _$ListsItemRepository {
  late final AppDatabase db = ref.read(databaseProvider);

  @override
  Stream<List<ShoppingListItemsData>> build() {
    return db.select(db.shoppingListItems).watch();
  }


  Stream<List<GroceryItemData>> fetchGroceryItemsForList(int listId) {
    final query = db.select(db.groceryItems).join([
      innerJoin(db.shoppingListItems,
          db.shoppingListItems.groceryItemId.equalsExp(db.groceryItems.id))
    ])
      ..where(db.shoppingListItems.shoppingListId.equals(listId));

    return query.watch().map((rows) {
      return rows
          .map((row) {
            final r = row.readTable(db.groceryItems);
            return GroceryItemData(
                id: r.id,
                name: r.name,
                price: r.price,
                quantity: r.quantity,
                storeName: r.storeName);
          })
          .toSet()
          .toList();
    });
  }
}
