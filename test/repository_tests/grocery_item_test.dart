import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:grocerapp/data/source/database/database.dart';
import 'package:grocerapp/domain/repository/grocery_item_repository.dart';

AppDatabase createInMemoryDatabase() {
  return AppDatabase(NativeDatabase.memory());
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('GroceryItemRepository Tests (In-Memory DB)', () {
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
      // Delete entire db table to get it ready for next run
      await db.delete(db.groceryItems).go();
      await db.close();
      container.dispose();
    });

    test('build() provides a stream of GroceryItemData', () async {
      final notifier = container.read(groceryItemRepositoryProvider.notifier);

      await notifier.addItem(
        name: 'Apples',
        quantity: 5,
        price: 1.99,
        location: 'Fruit Market',
      );

      await Future.delayed(const Duration(milliseconds: 50));
      final List<GroceryItemData> groceryList =
          await notifier.fetchGroceryItems();

      expect(groceryList.isNotEmpty, true);
      final lastEvent = groceryList.last;

      expect(lastEvent.name, 'Apples');
      expect(lastEvent.quantity, 5);
    });

    test('fetchGroceryItems() returns inserted items', () async {
      final notifier = container.read(groceryItemRepositoryProvider.notifier);

      await notifier.addItem(name: 'Milk', quantity: 1, price: 2.49);
      await notifier.addItem(name: 'Bread', quantity: 2, price: 3.49);

      final items = await notifier.fetchGroceryItems();
      expect(items.length, 2);
      expect(items[0].name, 'Milk');
      expect(items[1].name, 'Bread');
    });

    test('addItem() inserts item into the database', () async {
      final notifier = container.read(groceryItemRepositoryProvider.notifier);

      final newId = await notifier.addItem(
        name: 'Eggs',
        quantity: 12,
        price: 3.99,
      );

      final items = await notifier.fetchGroceryItems();
      expect(items.length, 1);
      expect(items[0].id, newId);
      expect(items[0].name, 'Eggs');
      expect(items[0].quantity, 12);
      expect(items[0].price, 3.99);
    });

    test('updateGroceryItem() updates existing item', () async {
      final notifier = container.read(groceryItemRepositoryProvider.notifier);

      final id = await notifier.addItem(
        name: 'Cheese',
        quantity: 2,
        price: 4.99,
      );

      await notifier.updateGroceryItem(
        id,
        name: 'Cheese (Updated)',
        quantity: 3,
        price: 5.49,
      );

      final items = await notifier.fetchGroceryItems();
      expect(items.length, 1);
      expect(items[0].name, 'Cheese (Updated)');
      expect(items[0].quantity, 3);
      expect(items[0].price, 5.49);
    });

    test('deleteItem() removes the item', () async {
      final notifier = container.read(groceryItemRepositoryProvider.notifier);

      final id = await notifier.addItem(
        name: 'Bananas',
        quantity: 6,
        price: 1.99,
      );

      var items = await notifier.fetchGroceryItems();
      expect(items.length, 1);

      notifier.deleteItem(id);

      items = await notifier.fetchGroceryItems();
      expect(items, isEmpty);
    });
  });
}
