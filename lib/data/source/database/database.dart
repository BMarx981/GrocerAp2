import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'database.g.dart';

@DataClassName('GroceryItemData')
class GroceryItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().nullable()();
  RealColumn get price => real().nullable()();
  IntColumn get quantity =>
      integer().nullable().withDefault(const Constant(1))();
  TextColumn get storeName => text().nullable()();
}

@DataClassName('RecipeData')
class Recipes extends Table {
  TextColumn get name => text()();
  IntColumn get id => integer().autoIncrement()();
}

@DataClassName('ShoppingListItemsData')
class ShoppingListItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get groceryItemId => integer().references(GroceryItems, #id)();
  IntColumn get shoppingListId => integer().references(ShoppingLists, #id)();
}

@DataClassName('ShoppingListData')
class ShoppingLists extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}

@DataClassName('RecipeGroceryItemData')
class RecipeItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get groceryItemId => integer().references(GroceryItems, #id)();
  IntColumn get recipeId => integer().references(Recipes, #id)();
}

@DriftDatabase(tables: [
  GroceryItems,
  RecipeItems,
  Recipes,
  ShoppingLists,
  ShoppingListItems
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;
}

final databaseProvider = Provider<AppDatabase>((ref) => AppDatabase());

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    print(file.path);
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
