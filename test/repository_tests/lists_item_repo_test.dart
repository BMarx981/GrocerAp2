import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:grocerapp/data/source/database/database.dart';
import 'package:grocerapp/domain/repository/lists_item_repository.dart';

AppDatabase createInMemoryDatabase() {
  return AppDatabase(NativeDatabase.memory());
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ListsItemRepository Tests', () {
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

      container = ProviderContainer(overrides: [
        databaseProvider.overrideWithValue(db),
      ]);
    });

    tearDown(() async {
      await db.delete(db.groceryItems).go();
      await db.delete(db.shoppingListItems).go();
      await db.close();
      container.dispose();
    });

    test('Test getItemsFromList(int listId) for the correct items in the list',
        () async {
      final item1 = await db.groceryItems.insertReturning(
        const GroceryItemData(
            id: 1, name: 'Item 1', price: 1, quantity: 1, storeName: 'Store 1'),
      );

      final item2 = await db.groceryItems.insertReturning(
        const GroceryItemData(
            id: 2, name: 'Item 2', price: 2, quantity: 2, storeName: 'Store 2'),
      );

      final list1 = await db.shoppingLists.insertReturning(
        ShoppingListsCompanion.insert(
          name: 'Test List',
        ),
      );
      final list1Id = list1.id;

      await db.shoppingListItems.insertReturning(
        ShoppingListItemsData(
            id: 1, groceryItemId: item1.id, shoppingListId: list1Id),
      );

      await db.shoppingListItems.insertReturning(
        ShoppingListItemsData(
            id: 2, groceryItemId: item2.id, shoppingListId: list1Id),
      );

      final notifier = container.read(listsItemRepositoryProvider.notifier);

      final items = await notifier.getItemsFromList(list1Id);

      expect(items, hasLength(2));
      List<String> names = [];
      final finalList = items;
      for (final thing in finalList) {
        names.add(thing.name ?? "");
      }
      expect(names, containsAll(['Item 1', 'Item 2']));
      expect(names, isNot(contains('Should Not Appear')));
    }); // End of test

    test('Test getItemsFromList(int listId) for the correct items in the list',
        () async {
      final item1 = await db.groceryItems.insertReturning(
        const GroceryItemData(
            id: 1, name: 'Item 1', price: 1, quantity: 1, storeName: 'Store 1'),
      );

      final item2 = await db.groceryItems.insertReturning(
        const GroceryItemData(
            id: 2, name: 'Item 2', price: 2, quantity: 2, storeName: 'Store 2'),
      );

      final list1 = await db.shoppingLists.insertReturning(
        ShoppingListsCompanion.insert(
          name: 'Test List',
        ),
      );
      final list1Id = list1.id;

      await db.shoppingListItems.insertReturning(
        ShoppingListItemsData(
            id: 1, groceryItemId: item1.id, shoppingListId: list1Id),
      );

      await db.shoppingListItems.insertReturning(
        ShoppingListItemsData(
            id: 2, groceryItemId: item2.id, shoppingListId: list1Id),
      );

      final notifier = container.read(listsItemRepositoryProvider.notifier);

      final items = await notifier.getItemsFromList(list1Id);

      expect(items, hasLength(2));
      List<String> names = [];
      final finalList = items;
      for (final thing in finalList) {
        names.add(thing.name ?? "");
      }
      expect(names, containsAll(['Item 1', 'Item 2']));
      expect(names, isNot(contains('Should Not Appear')));
    }); // End of test

    test(
      'addItemToShoppingList(int groceryItemId, int shoppingListId) adds the item to the correct list',
      () async {
        final item1 = await db.groceryItems.insertReturning(
          const GroceryItemData(
              id: 1,
              name: 'Item 1',
              price: 1,
              quantity: 1,
              storeName: 'Store 1'),
        );

        final item2 = await db.groceryItems.insertReturning(
          const GroceryItemData(
              id: 2,
              name: 'Item 2',
              price: 2,
              quantity: 2,
              storeName: 'Store 2'),
        );

        final list1 = await db.shoppingLists.insertReturning(
          ShoppingListsCompanion.insert(
            name: 'Test List',
          ),
        );
        final list1Id = list1.id;

        await db.shoppingListItems.insertReturning(
          ShoppingListItemsData(
              id: 1, groceryItemId: item1.id, shoppingListId: list1Id),
        );

        await db.shoppingListItems.insertReturning(
          ShoppingListItemsData(
              id: 2, groceryItemId: item2.id, shoppingListId: list1Id),
        );

        final notifier = container.read(listsItemRepositoryProvider.notifier);
        await notifier.addItemToShoppingList(1, 1);

        final itemsInList = db.select(db.shoppingListItems)
          ..where((tbl) => tbl.id.equals(list1Id));
        final results = await itemsInList.get();

        expect(results, hasLength(2));
        expect(results.first.id, item1);
        expect(results.first.shoppingListId, item1);
        expect(results.first.groceryItemId, 1);
      },
    );
  }); // End Group
}
