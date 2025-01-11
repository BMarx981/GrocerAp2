import 'package:drift/drift.dart';
import 'package:grocerapp/data/source/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_repository.g.dart';

@riverpod
class RecipeRepository extends _$RecipeRepository {
  late final AppDatabase db = ref.read(databaseProvider);

  @override
  Stream<List<RecipeData>> build() {
    return db.select(db.recipes).watch();
  }

  Stream<List<GroceryItemData>> fetchGroeceryItemsForRecipe(int recipeId) {
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

  Future<int> addItemToRecipeList(int groceryItemId, int recipeId) async {
    return await db.into(db.recipeItems).insert(
          RecipeItemsCompanion(
            groceryItemId: Value(groceryItemId),
            recipeId: Value(recipeId),
          ),
        );
  }

  Future<int> addRecipe(String name) {
    return db.into(db.recipes).insert(
          RecipesCompanion(
            name: Value(name),
          ),
        );
  }

  Future<int> addItemToRecipe(int groceryItemId, int recipeId) {
    return db.into(db.recipeItems).insert(
          RecipeItemsCompanion(
            groceryItemId: Value(groceryItemId),
            recipeId: Value(recipeId),
          ),
        );
  }

  Future updateRecipe(int id, String name) {
    final update = (db.update(db.recipes)..where((t) => t.id.equals(id)))
        .write(RecipesCompanion(name: Value(name)));
    return update;
  }

  void deleteRecipe(int id) {
    (db.delete(db.recipes)..where((t) => t.id.equals(id))).go();
  }
}
