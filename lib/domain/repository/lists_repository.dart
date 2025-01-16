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

  Future<List<ShoppingListData>> getShoppingLists() {
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

  Future updateList(int id, String name) {
    final update = (db.update(db.shoppingLists)..where((t) => t.id.equals(id)))
        .write(ShoppingListsCompanion(name: Value(name)));
    return update;
  }

  void deleteList(int id) {
    (db.delete(db.shoppingLists)..where((t) => t.id.equals(id))).go();
  }
}
