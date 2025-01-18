import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:grocerapp/data/source/database/database.dart';
import 'package:grocerapp/domain/repository/recipe_repository.dart';

AppDatabase createInMemoryDatabase() {
  return AppDatabase(NativeDatabase.memory());
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Recipe repository tests', () {
    late ProviderContainer container;
    late AppDatabase db;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
            const MethodChannel('plugins.flutter.io/path_provider'),
            (MethodCall methodCall) async {
      return '.';
    });

    setUp(() async {
      db = createInMemoryDatabase();

      container = ProviderContainer(
        overrides: [databaseProvider.overrideWithValue(db)],
      );
    });

    tearDown(() async {
      await db.delete(db.recipes).go();
      await db.close();
      container.dispose();
    });

    test('getRecipe() provides a list of RecipeData', () async {
      final notifier = container.read(recipeRepositoryProvider.notifier);
      List<RecipeData> recipeList = await notifier.getRecipes();
      expect(recipeList.isEmpty, true);

      await notifier.addRecipe('Pizza');

      await Future.delayed(const Duration(milliseconds: 50));

      recipeList = await notifier.getRecipes();
      expect(recipeList.isNotEmpty, true);
      final lastList = recipeList.last;

      expect(lastList.name, 'Pizza');
      expect(recipeList.length, 1);
    });

    test(
        'addRecipe adds a new recipe to the mock database in the recipes table',
        () async {
      final notifier = container.read(recipeRepositoryProvider.notifier);

      List<RecipeData> recipeList = await notifier.getRecipes();
      expect(recipeList.isEmpty, true);

      await notifier.addRecipe('Pizza');

      await Future.delayed(const Duration(milliseconds: 50));

      recipeList = await notifier.getRecipes();
      expect(recipeList.isNotEmpty, true);
      final lastList = recipeList.last;
      expect(lastList.name, 'Pizza');
    });

    test(
        'updateList() checks id the notifier will update the list table as expected',
        () async {
      final notifier = container.read(recipeRepositoryProvider.notifier);

      List<RecipeData> recipeList = await notifier.getRecipes();
      expect(recipeList.isEmpty, true);

      final id = await notifier.addRecipe('Salad');
      await notifier.updateRecipe(id, 'Chicken Salad');

      final recipe = await notifier.getRecipes();
      expect(recipe.last.name, 'Chicken Salad');
    });

    test('deleteRecipe() checks if removing a list works as expected',
        () async {
      final notifier = container.read(recipeRepositoryProvider.notifier);

      List<RecipeData> recipeList = await notifier.getRecipes();
      expect(recipeList.isEmpty, true);

      final id = await notifier.addRecipe('Blueberry pie');

      List<RecipeData> lists = await notifier.getRecipes();
      expect(lists.length, 1);

      notifier.deleteRecipe(id);

      lists = await notifier.getRecipes();
      expect(lists, isEmpty);
    });
  }); // End of group
}
