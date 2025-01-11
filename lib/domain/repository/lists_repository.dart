import 'package:drift/drift.dart';
import 'package:grocerapp/data/source/database/database.dart';
import 'package:grocerapp/domain/models/shopping_list_items.dart';
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
    final query = (db.select(db.groceryItems).join([
      innerJoin(
          db.shoppingLists, db.shoppingLists.id.equalsExp(db.groceryItems.id))
    ])
      ..where(db.shoppingLists.id.equals(listId)));

    return query.watch().map((rows) {
      return rows.map((row) {
        final r = row.readTable(db.groceryItems);
        return GroceryItemData(
            id: r.id,
            name: r.name,
            price: r.price,
            quantity: r.quantity,
            location: r.location);
      }).toList();
    });
  }

  Future<List<GroceryItemData>> getItemsForShoppingList(int shoppingListId) {
    final query = db.select(db.groceryItems).join([
      innerJoin(
          db.shoppingLists, db.shoppingLists.id.equalsExp(db.groceryItems.id))
    ])
      ..where(db.shoppingLists.id.equals(shoppingListId));

    return query.map((row) => row.readTable(db.groceryItems)).get();
  }

  // Future<int> addToShoppingList(int groceryItemId, String? name) async {
  //   return db.into(db.shoppingLists).insert(ShoppingListsCompanion.insert(
  //       id: Value(groceryItemId), name: Value(name)));
  // }

  Future<List<dynamic>> getShoppingListItems() async {
    return db.select(db.shoppingLists).get();
  }

  Future<int> addList(String name) async {
    final result = await db.into(db.shoppingLists).insert(
          ShoppingListsCompanion(
            name: Value(name),
          ),
        );
    return result;
  }

  Future<int> addItemToList(int listId, ShoppingListItems items, String name) {
    return db
        .into(db.shoppingLists)
        .insert(ShoppingListData(name: name, id: listId, items: items));
  }

  Future updateList(int id, {String? name}) {
    final update = (db.update(db.groceryItems)..where((t) => t.id.equals(id)))
        .write(GroceryItemsCompanion(name: Value(name)));
    return update;
  }

  Future updateRecipeName(int id, {String? name}) {
    final update = (db.update(db.recipes)..where((t) => t.id.equals(id)))
        .write(RecipesCompanion(name: Value(name)));
    return update;
  }

  void deleteList(int id) {
    (db.delete(db.shoppingLists)..where((t) => t.id.equals(id))).go();
  }
}
