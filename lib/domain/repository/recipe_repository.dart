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

  Future<int> addRecipe(String name) {
    return db.into(db.recipes).insert(
          RecipesCompanion(
            name: Value(name),
          ),
        );
  }

  Future<List<RecipeData>> getRecipes() {
    return db.select(db.recipes).get();
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
