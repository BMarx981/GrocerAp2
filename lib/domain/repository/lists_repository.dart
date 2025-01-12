import 'package:drift/drift.dart';
import 'package:grocerapp/data/source/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lists_repository.g.dart';

@riverpod
class ListsRepository extends _$ListsRepository {
  late final AppDatabase db = ref.read(databaseProvider);

  @override
  Stream<List<ShoppingListData>> build() {
    return db.select(db.shoppingLists).watch();
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

  Future<List<GroceryItemData>> getItemsInShoppingList(int shoppingListId) {
    final query = db.select(db.groceryItems).join([
      innerJoin(db.shoppingListItems,
          db.shoppingListItems.groceryItemId.equalsExp(db.groceryItems.id))
    ])
      ..where(db.shoppingListItems.shoppingListId.equals(shoppingListId));

    return query.map((row) => row.readTable(db.groceryItems)).get();
  }

  Future<int> addItemToShoppingList(int groceryItemId, int shoppingListId) {
    return db.into(db.shoppingListItems).insert(
          ShoppingListItemsCompanion(
            groceryItemId: Value(groceryItemId),
            shoppingListId: Value(shoppingListId),
          ),
        );
  }

  Future<int> addList(String name) async {
    final result = await db.into(db.shoppingLists).insert(
          ShoppingListsCompanion(
            name: Value(name),
          ),
        );
    return result;
  }

  Future updateList(int id, String name) {
    final update = (db.update(db.shoppingLists)..where((t) => t.id.equals(id)))
        .write(ShoppingListsCompanion(name: Value(name)));
    return update;
  }

  void deleteList(int id) {
    (db.delete(db.shoppingLists)..where((t) => t.id.equals(id))).go();
  }

  void deleteItemFromShoppingList(int itemId, int listId) {
    (db.delete(db.shoppingListItems)..where((t) => t.id.equals(itemId))).go();
  }
}
