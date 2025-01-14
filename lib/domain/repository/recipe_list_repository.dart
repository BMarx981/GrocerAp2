import 'package:drift/drift.dart';
import 'package:grocerapp/data/source/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_list_repository.g.dart';

@riverpod
class RecipeListRepository extends _$RecipeListRepository {
  late final AppDatabase db = ref.read(databaseProvider);

  @override
  Stream<List<RecipeGroceryItemData>> build() {
    return db.select(db.recipeItems).watch();
  }

  void deleteRecipeItem(int itemId, int recipeId) async {
    // Delete associated recipe items first
    await (db.delete(db.recipeItems)
          ..where((item) => item.recipeId.equals(recipeId)))
        .go();
  }

  Future<int> addItemToRecipeList(int groceryItemId, int recipeId) async {
    return await db.into(db.recipeItems).insert(
          RecipeItemsCompanion(
            groceryItemId: Value(groceryItemId),
            recipeId: Value(recipeId),
          ),
        );
  }

  Stream<List<GroceryItemData>> fetchGroceryItemsForRecipe(int recipeId) {
    final query = db.select(db.groceryItems).join([
      innerJoin(db.recipeItems,
          db.recipeItems.groceryItemId.equalsExp(db.groceryItems.id))
    ])
      ..where(db.recipeItems.recipeId.equals(recipeId));

    return query.watch().map((rows) {
      return rows
          .map((row) {
            final r = row.readTable(db.groceryItems);
            return GroceryItemData(
              id: r.id,
              name: r.name,
              price: r.price,
              quantity: r.quantity,
              storeName: r.storeName,
            );
          })
          .toSet()
          .toList();
    });
  }
}
