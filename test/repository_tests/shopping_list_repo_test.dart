import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:grocerapp/data/source/database/database.dart';
import 'package:grocerapp/domain/repository/lists_repository.dart';

AppDatabase createInMemoryDatabase() {
  return AppDatabase(NativeDatabase.memory());
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('ShoppingListRepository Tests', () {
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
        overrides: [
          databaseProvider.overrideWithValue(db),
        ],
      );
    });

    tearDown(() async {
      await db.delete(db.shoppingLists).go();
      await db.close();
      container.dispose();
    });

    test('getShoppingLists() provides a list of ShoppingListData', () async {
      final notifier = container.read(listsRepositoryProvider.notifier);

      List<ShoppingListData> shoppingList = await notifier.getShoppingLists();
      expect(shoppingList.isEmpty, true);

      await notifier.addList('Dinner');

      await Future.delayed(const Duration(milliseconds: 50));

      shoppingList = await notifier.getShoppingLists();
      expect(shoppingList.isNotEmpty, true);
      final lastList = shoppingList.last;

      expect(lastList.name, 'Dinner');
      expect(shoppingList.length, 1);
    });

    test('addList() creates a new entry to the shoppingList table', () async {
      final notifier = container.read(listsRepositoryProvider.notifier);

      List<ShoppingListData> shoppingList = await notifier.getShoppingLists();
      expect(shoppingList.isEmpty, true);

      await notifier.addList('Pizza');

      shoppingList = await notifier.getShoppingLists();
      expect(shoppingList.last.name, 'Pizza');
    });

    test(
        'updateList() checks if the notifier will update the list table as expected.',
        () async {
      final notifier = container.read(listsRepositoryProvider.notifier);

      List<ShoppingListData> shoppingList = await notifier.getShoppingLists();
      expect(shoppingList.isEmpty, true);

      final id = await notifier.addList('Ziti');
      await notifier.updateList(id, 'Pasta');

      final items = await notifier.getShoppingLists();
      expect(items.last.name, 'Pasta');
    });

    test('deleteList() checks if the repo deletes the columm as expected',
        () async {
      final notifier = container.read(listsRepositoryProvider.notifier);

      List<ShoppingListData> shoppingList = await notifier.getShoppingLists();
      expect(shoppingList.isEmpty, true);

      final id = await notifier.addList('Lunch');

      List<ShoppingListData> lists = await notifier.getShoppingLists();
      expect(lists.length, 1);

      notifier.deleteList(id);

      lists = await notifier.getShoppingLists();
      expect(lists, isEmpty);
    });
  }); // End Group
}
