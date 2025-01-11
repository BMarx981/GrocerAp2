// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $GroceryItemsTable extends GroceryItems
    with TableInfo<$GroceryItemsTable, GroceryItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GroceryItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _storeNameMeta =
      const VerificationMeta('storeName');
  @override
  late final GeneratedColumn<String> storeName = GeneratedColumn<String>(
      'store_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, price, quantity, storeName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'grocery_items';
  @override
  VerificationContext validateIntegrity(Insertable<GroceryItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    }
    if (data.containsKey('store_name')) {
      context.handle(_storeNameMeta,
          storeName.isAcceptableOrUnknown(data['store_name']!, _storeNameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GroceryItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GroceryItemData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price']),
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity']),
      storeName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}store_name']),
    );
  }

  @override
  $GroceryItemsTable createAlias(String alias) {
    return $GroceryItemsTable(attachedDatabase, alias);
  }
}

class GroceryItemData extends DataClass implements Insertable<GroceryItemData> {
  final int id;
  final String? name;
  final double? price;
  final int? quantity;
  final String? storeName;
  const GroceryItemData(
      {required this.id, this.name, this.price, this.quantity, this.storeName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double>(price);
    }
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<int>(quantity);
    }
    if (!nullToAbsent || storeName != null) {
      map['store_name'] = Variable<String>(storeName);
    }
    return map;
  }

  GroceryItemsCompanion toCompanion(bool nullToAbsent) {
    return GroceryItemsCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      quantity: quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity),
      storeName: storeName == null && nullToAbsent
          ? const Value.absent()
          : Value(storeName),
    );
  }

  factory GroceryItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GroceryItemData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      price: serializer.fromJson<double?>(json['price']),
      quantity: serializer.fromJson<int?>(json['quantity']),
      storeName: serializer.fromJson<String?>(json['storeName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
      'price': serializer.toJson<double?>(price),
      'quantity': serializer.toJson<int?>(quantity),
      'storeName': serializer.toJson<String?>(storeName),
    };
  }

  GroceryItemData copyWith(
          {int? id,
          Value<String?> name = const Value.absent(),
          Value<double?> price = const Value.absent(),
          Value<int?> quantity = const Value.absent(),
          Value<String?> storeName = const Value.absent()}) =>
      GroceryItemData(
        id: id ?? this.id,
        name: name.present ? name.value : this.name,
        price: price.present ? price.value : this.price,
        quantity: quantity.present ? quantity.value : this.quantity,
        storeName: storeName.present ? storeName.value : this.storeName,
      );
  GroceryItemData copyWithCompanion(GroceryItemsCompanion data) {
    return GroceryItemData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      price: data.price.present ? data.price.value : this.price,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      storeName: data.storeName.present ? data.storeName.value : this.storeName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GroceryItemData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('quantity: $quantity, ')
          ..write('storeName: $storeName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, price, quantity, storeName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GroceryItemData &&
          other.id == this.id &&
          other.name == this.name &&
          other.price == this.price &&
          other.quantity == this.quantity &&
          other.storeName == this.storeName);
}

class GroceryItemsCompanion extends UpdateCompanion<GroceryItemData> {
  final Value<int> id;
  final Value<String?> name;
  final Value<double?> price;
  final Value<int?> quantity;
  final Value<String?> storeName;
  const GroceryItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.quantity = const Value.absent(),
    this.storeName = const Value.absent(),
  });
  GroceryItemsCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.quantity = const Value.absent(),
    this.storeName = const Value.absent(),
  });
  static Insertable<GroceryItemData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? price,
    Expression<int>? quantity,
    Expression<String>? storeName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (quantity != null) 'quantity': quantity,
      if (storeName != null) 'store_name': storeName,
    });
  }

  GroceryItemsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? name,
      Value<double?>? price,
      Value<int?>? quantity,
      Value<String?>? storeName}) {
    return GroceryItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      storeName: storeName ?? this.storeName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (storeName.present) {
      map['store_name'] = Variable<String>(storeName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GroceryItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('quantity: $quantity, ')
          ..write('storeName: $storeName')
          ..write(')'))
        .toString();
  }
}

class $RecipesTable extends Recipes with TableInfo<$RecipesTable, RecipeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  List<GeneratedColumn> get $columns => [name, id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipes';
  @override
  VerificationContext validateIntegrity(Insertable<RecipeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecipeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeData(
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
    );
  }

  @override
  $RecipesTable createAlias(String alias) {
    return $RecipesTable(attachedDatabase, alias);
  }
}

class RecipeData extends DataClass implements Insertable<RecipeData> {
  final String name;
  final int id;
  const RecipeData({required this.name, required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['id'] = Variable<int>(id);
    return map;
  }

  RecipesCompanion toCompanion(bool nullToAbsent) {
    return RecipesCompanion(
      name: Value(name),
      id: Value(id),
    );
  }

  factory RecipeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeData(
      name: serializer.fromJson<String>(json['name']),
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'id': serializer.toJson<int>(id),
    };
  }

  RecipeData copyWith({String? name, int? id}) => RecipeData(
        name: name ?? this.name,
        id: id ?? this.id,
      );
  RecipeData copyWithCompanion(RecipesCompanion data) {
    return RecipeData(
      name: data.name.present ? data.name.value : this.name,
      id: data.id.present ? data.id.value : this.id,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeData(')
          ..write('name: $name, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, id);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeData && other.name == this.name && other.id == this.id);
}

class RecipesCompanion extends UpdateCompanion<RecipeData> {
  final Value<String> name;
  final Value<int> id;
  const RecipesCompanion({
    this.name = const Value.absent(),
    this.id = const Value.absent(),
  });
  RecipesCompanion.insert({
    required String name,
    this.id = const Value.absent(),
  }) : name = Value(name);
  static Insertable<RecipeData> custom({
    Expression<String>? name,
    Expression<int>? id,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (id != null) 'id': id,
    });
  }

  RecipesCompanion copyWith({Value<String>? name, Value<int>? id}) {
    return RecipesCompanion(
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipesCompanion(')
          ..write('name: $name, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

class $RecipeItemsTable extends RecipeItems
    with TableInfo<$RecipeItemsTable, RecipeGroceryItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _groceryItemIdMeta =
      const VerificationMeta('groceryItemId');
  @override
  late final GeneratedColumn<int> groceryItemId = GeneratedColumn<int>(
      'grocery_item_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES grocery_items (id)'));
  static const VerificationMeta _recipeIdMeta =
      const VerificationMeta('recipeId');
  @override
  late final GeneratedColumn<int> recipeId = GeneratedColumn<int>(
      'recipe_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES recipes (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, groceryItemId, recipeId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe_items';
  @override
  VerificationContext validateIntegrity(
      Insertable<RecipeGroceryItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('grocery_item_id')) {
      context.handle(
          _groceryItemIdMeta,
          groceryItemId.isAcceptableOrUnknown(
              data['grocery_item_id']!, _groceryItemIdMeta));
    } else if (isInserting) {
      context.missing(_groceryItemIdMeta);
    }
    if (data.containsKey('recipe_id')) {
      context.handle(_recipeIdMeta,
          recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta));
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecipeGroceryItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeGroceryItemData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      groceryItemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}grocery_item_id'])!,
      recipeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}recipe_id'])!,
    );
  }

  @override
  $RecipeItemsTable createAlias(String alias) {
    return $RecipeItemsTable(attachedDatabase, alias);
  }
}

class RecipeGroceryItemData extends DataClass
    implements Insertable<RecipeGroceryItemData> {
  final int id;
  final int groceryItemId;
  final int recipeId;
  const RecipeGroceryItemData(
      {required this.id, required this.groceryItemId, required this.recipeId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['grocery_item_id'] = Variable<int>(groceryItemId);
    map['recipe_id'] = Variable<int>(recipeId);
    return map;
  }

  RecipeItemsCompanion toCompanion(bool nullToAbsent) {
    return RecipeItemsCompanion(
      id: Value(id),
      groceryItemId: Value(groceryItemId),
      recipeId: Value(recipeId),
    );
  }

  factory RecipeGroceryItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeGroceryItemData(
      id: serializer.fromJson<int>(json['id']),
      groceryItemId: serializer.fromJson<int>(json['groceryItemId']),
      recipeId: serializer.fromJson<int>(json['recipeId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'groceryItemId': serializer.toJson<int>(groceryItemId),
      'recipeId': serializer.toJson<int>(recipeId),
    };
  }

  RecipeGroceryItemData copyWith(
          {int? id, int? groceryItemId, int? recipeId}) =>
      RecipeGroceryItemData(
        id: id ?? this.id,
        groceryItemId: groceryItemId ?? this.groceryItemId,
        recipeId: recipeId ?? this.recipeId,
      );
  RecipeGroceryItemData copyWithCompanion(RecipeItemsCompanion data) {
    return RecipeGroceryItemData(
      id: data.id.present ? data.id.value : this.id,
      groceryItemId: data.groceryItemId.present
          ? data.groceryItemId.value
          : this.groceryItemId,
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeGroceryItemData(')
          ..write('id: $id, ')
          ..write('groceryItemId: $groceryItemId, ')
          ..write('recipeId: $recipeId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, groceryItemId, recipeId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeGroceryItemData &&
          other.id == this.id &&
          other.groceryItemId == this.groceryItemId &&
          other.recipeId == this.recipeId);
}

class RecipeItemsCompanion extends UpdateCompanion<RecipeGroceryItemData> {
  final Value<int> id;
  final Value<int> groceryItemId;
  final Value<int> recipeId;
  const RecipeItemsCompanion({
    this.id = const Value.absent(),
    this.groceryItemId = const Value.absent(),
    this.recipeId = const Value.absent(),
  });
  RecipeItemsCompanion.insert({
    this.id = const Value.absent(),
    required int groceryItemId,
    required int recipeId,
  })  : groceryItemId = Value(groceryItemId),
        recipeId = Value(recipeId);
  static Insertable<RecipeGroceryItemData> custom({
    Expression<int>? id,
    Expression<int>? groceryItemId,
    Expression<int>? recipeId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (groceryItemId != null) 'grocery_item_id': groceryItemId,
      if (recipeId != null) 'recipe_id': recipeId,
    });
  }

  RecipeItemsCompanion copyWith(
      {Value<int>? id, Value<int>? groceryItemId, Value<int>? recipeId}) {
    return RecipeItemsCompanion(
      id: id ?? this.id,
      groceryItemId: groceryItemId ?? this.groceryItemId,
      recipeId: recipeId ?? this.recipeId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (groceryItemId.present) {
      map['grocery_item_id'] = Variable<int>(groceryItemId.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<int>(recipeId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeItemsCompanion(')
          ..write('id: $id, ')
          ..write('groceryItemId: $groceryItemId, ')
          ..write('recipeId: $recipeId')
          ..write(')'))
        .toString();
  }
}

class $ShoppingListsTable extends ShoppingLists
    with TableInfo<$ShoppingListsTable, ShoppingListData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShoppingListsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shopping_lists';
  @override
  VerificationContext validateIntegrity(Insertable<ShoppingListData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShoppingListData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShoppingListData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $ShoppingListsTable createAlias(String alias) {
    return $ShoppingListsTable(attachedDatabase, alias);
  }
}

class ShoppingListData extends DataClass
    implements Insertable<ShoppingListData> {
  final int id;
  final String name;
  const ShoppingListData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  ShoppingListsCompanion toCompanion(bool nullToAbsent) {
    return ShoppingListsCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory ShoppingListData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShoppingListData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  ShoppingListData copyWith({int? id, String? name}) => ShoppingListData(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  ShoppingListData copyWithCompanion(ShoppingListsCompanion data) {
    return ShoppingListData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShoppingListData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShoppingListData &&
          other.id == this.id &&
          other.name == this.name);
}

class ShoppingListsCompanion extends UpdateCompanion<ShoppingListData> {
  final Value<int> id;
  final Value<String> name;
  const ShoppingListsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  ShoppingListsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<ShoppingListData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  ShoppingListsCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return ShoppingListsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShoppingListsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ShoppingListItemsTable extends ShoppingListItems
    with TableInfo<$ShoppingListItemsTable, ShoppingListItemsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShoppingListItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _groceryItemIdMeta =
      const VerificationMeta('groceryItemId');
  @override
  late final GeneratedColumn<int> groceryItemId = GeneratedColumn<int>(
      'grocery_item_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES grocery_items (id)'));
  static const VerificationMeta _shoppingListIdMeta =
      const VerificationMeta('shoppingListId');
  @override
  late final GeneratedColumn<int> shoppingListId = GeneratedColumn<int>(
      'shopping_list_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES shopping_lists (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, groceryItemId, shoppingListId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shopping_list_items';
  @override
  VerificationContext validateIntegrity(
      Insertable<ShoppingListItemsData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('grocery_item_id')) {
      context.handle(
          _groceryItemIdMeta,
          groceryItemId.isAcceptableOrUnknown(
              data['grocery_item_id']!, _groceryItemIdMeta));
    } else if (isInserting) {
      context.missing(_groceryItemIdMeta);
    }
    if (data.containsKey('shopping_list_id')) {
      context.handle(
          _shoppingListIdMeta,
          shoppingListId.isAcceptableOrUnknown(
              data['shopping_list_id']!, _shoppingListIdMeta));
    } else if (isInserting) {
      context.missing(_shoppingListIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShoppingListItemsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShoppingListItemsData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      groceryItemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}grocery_item_id'])!,
      shoppingListId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}shopping_list_id'])!,
    );
  }

  @override
  $ShoppingListItemsTable createAlias(String alias) {
    return $ShoppingListItemsTable(attachedDatabase, alias);
  }
}

class ShoppingListItemsData extends DataClass
    implements Insertable<ShoppingListItemsData> {
  final int id;
  final int groceryItemId;
  final int shoppingListId;
  const ShoppingListItemsData(
      {required this.id,
      required this.groceryItemId,
      required this.shoppingListId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['grocery_item_id'] = Variable<int>(groceryItemId);
    map['shopping_list_id'] = Variable<int>(shoppingListId);
    return map;
  }

  ShoppingListItemsCompanion toCompanion(bool nullToAbsent) {
    return ShoppingListItemsCompanion(
      id: Value(id),
      groceryItemId: Value(groceryItemId),
      shoppingListId: Value(shoppingListId),
    );
  }

  factory ShoppingListItemsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShoppingListItemsData(
      id: serializer.fromJson<int>(json['id']),
      groceryItemId: serializer.fromJson<int>(json['groceryItemId']),
      shoppingListId: serializer.fromJson<int>(json['shoppingListId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'groceryItemId': serializer.toJson<int>(groceryItemId),
      'shoppingListId': serializer.toJson<int>(shoppingListId),
    };
  }

  ShoppingListItemsData copyWith(
          {int? id, int? groceryItemId, int? shoppingListId}) =>
      ShoppingListItemsData(
        id: id ?? this.id,
        groceryItemId: groceryItemId ?? this.groceryItemId,
        shoppingListId: shoppingListId ?? this.shoppingListId,
      );
  ShoppingListItemsData copyWithCompanion(ShoppingListItemsCompanion data) {
    return ShoppingListItemsData(
      id: data.id.present ? data.id.value : this.id,
      groceryItemId: data.groceryItemId.present
          ? data.groceryItemId.value
          : this.groceryItemId,
      shoppingListId: data.shoppingListId.present
          ? data.shoppingListId.value
          : this.shoppingListId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShoppingListItemsData(')
          ..write('id: $id, ')
          ..write('groceryItemId: $groceryItemId, ')
          ..write('shoppingListId: $shoppingListId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, groceryItemId, shoppingListId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShoppingListItemsData &&
          other.id == this.id &&
          other.groceryItemId == this.groceryItemId &&
          other.shoppingListId == this.shoppingListId);
}

class ShoppingListItemsCompanion
    extends UpdateCompanion<ShoppingListItemsData> {
  final Value<int> id;
  final Value<int> groceryItemId;
  final Value<int> shoppingListId;
  const ShoppingListItemsCompanion({
    this.id = const Value.absent(),
    this.groceryItemId = const Value.absent(),
    this.shoppingListId = const Value.absent(),
  });
  ShoppingListItemsCompanion.insert({
    this.id = const Value.absent(),
    required int groceryItemId,
    required int shoppingListId,
  })  : groceryItemId = Value(groceryItemId),
        shoppingListId = Value(shoppingListId);
  static Insertable<ShoppingListItemsData> custom({
    Expression<int>? id,
    Expression<int>? groceryItemId,
    Expression<int>? shoppingListId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (groceryItemId != null) 'grocery_item_id': groceryItemId,
      if (shoppingListId != null) 'shopping_list_id': shoppingListId,
    });
  }

  ShoppingListItemsCompanion copyWith(
      {Value<int>? id, Value<int>? groceryItemId, Value<int>? shoppingListId}) {
    return ShoppingListItemsCompanion(
      id: id ?? this.id,
      groceryItemId: groceryItemId ?? this.groceryItemId,
      shoppingListId: shoppingListId ?? this.shoppingListId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (groceryItemId.present) {
      map['grocery_item_id'] = Variable<int>(groceryItemId.value);
    }
    if (shoppingListId.present) {
      map['shopping_list_id'] = Variable<int>(shoppingListId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShoppingListItemsCompanion(')
          ..write('id: $id, ')
          ..write('groceryItemId: $groceryItemId, ')
          ..write('shoppingListId: $shoppingListId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $GroceryItemsTable groceryItems = $GroceryItemsTable(this);
  late final $RecipesTable recipes = $RecipesTable(this);
  late final $RecipeItemsTable recipeItems = $RecipeItemsTable(this);
  late final $ShoppingListsTable shoppingLists = $ShoppingListsTable(this);
  late final $ShoppingListItemsTable shoppingListItems =
      $ShoppingListItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [groceryItems, recipes, recipeItems, shoppingLists, shoppingListItems];
}

typedef $$GroceryItemsTableCreateCompanionBuilder = GroceryItemsCompanion
    Function({
  Value<int> id,
  Value<String?> name,
  Value<double?> price,
  Value<int?> quantity,
  Value<String?> storeName,
});
typedef $$GroceryItemsTableUpdateCompanionBuilder = GroceryItemsCompanion
    Function({
  Value<int> id,
  Value<String?> name,
  Value<double?> price,
  Value<int?> quantity,
  Value<String?> storeName,
});

final class $$GroceryItemsTableReferences
    extends BaseReferences<_$AppDatabase, $GroceryItemsTable, GroceryItemData> {
  $$GroceryItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RecipeItemsTable, List<RecipeGroceryItemData>>
      _recipeItemsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.recipeItems,
              aliasName: $_aliasNameGenerator(
                  db.groceryItems.id, db.recipeItems.groceryItemId));

  $$RecipeItemsTableProcessedTableManager get recipeItemsRefs {
    final manager = $$RecipeItemsTableTableManager($_db, $_db.recipeItems)
        .filter((f) => f.groceryItemId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_recipeItemsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ShoppingListItemsTable,
      List<ShoppingListItemsData>> _shoppingListItemsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.shoppingListItems,
          aliasName: $_aliasNameGenerator(
              db.groceryItems.id, db.shoppingListItems.groceryItemId));

  $$ShoppingListItemsTableProcessedTableManager get shoppingListItemsRefs {
    final manager =
        $$ShoppingListItemsTableTableManager($_db, $_db.shoppingListItems)
            .filter((f) => f.groceryItemId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_shoppingListItemsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$GroceryItemsTableFilterComposer
    extends Composer<_$AppDatabase, $GroceryItemsTable> {
  $$GroceryItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get storeName => $composableBuilder(
      column: $table.storeName, builder: (column) => ColumnFilters(column));

  Expression<bool> recipeItemsRefs(
      Expression<bool> Function($$RecipeItemsTableFilterComposer f) f) {
    final $$RecipeItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.recipeItems,
        getReferencedColumn: (t) => t.groceryItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecipeItemsTableFilterComposer(
              $db: $db,
              $table: $db.recipeItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> shoppingListItemsRefs(
      Expression<bool> Function($$ShoppingListItemsTableFilterComposer f) f) {
    final $$ShoppingListItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.shoppingListItems,
        getReferencedColumn: (t) => t.groceryItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ShoppingListItemsTableFilterComposer(
              $db: $db,
              $table: $db.shoppingListItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GroceryItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $GroceryItemsTable> {
  $$GroceryItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get storeName => $composableBuilder(
      column: $table.storeName, builder: (column) => ColumnOrderings(column));
}

class $$GroceryItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GroceryItemsTable> {
  $$GroceryItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get storeName =>
      $composableBuilder(column: $table.storeName, builder: (column) => column);

  Expression<T> recipeItemsRefs<T extends Object>(
      Expression<T> Function($$RecipeItemsTableAnnotationComposer a) f) {
    final $$RecipeItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.recipeItems,
        getReferencedColumn: (t) => t.groceryItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecipeItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.recipeItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> shoppingListItemsRefs<T extends Object>(
      Expression<T> Function($$ShoppingListItemsTableAnnotationComposer a) f) {
    final $$ShoppingListItemsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.shoppingListItems,
            getReferencedColumn: (t) => t.groceryItemId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ShoppingListItemsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.shoppingListItems,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$GroceryItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GroceryItemsTable,
    GroceryItemData,
    $$GroceryItemsTableFilterComposer,
    $$GroceryItemsTableOrderingComposer,
    $$GroceryItemsTableAnnotationComposer,
    $$GroceryItemsTableCreateCompanionBuilder,
    $$GroceryItemsTableUpdateCompanionBuilder,
    (GroceryItemData, $$GroceryItemsTableReferences),
    GroceryItemData,
    PrefetchHooks Function(
        {bool recipeItemsRefs, bool shoppingListItemsRefs})> {
  $$GroceryItemsTableTableManager(_$AppDatabase db, $GroceryItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GroceryItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GroceryItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GroceryItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<double?> price = const Value.absent(),
            Value<int?> quantity = const Value.absent(),
            Value<String?> storeName = const Value.absent(),
          }) =>
              GroceryItemsCompanion(
            id: id,
            name: name,
            price: price,
            quantity: quantity,
            storeName: storeName,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<double?> price = const Value.absent(),
            Value<int?> quantity = const Value.absent(),
            Value<String?> storeName = const Value.absent(),
          }) =>
              GroceryItemsCompanion.insert(
            id: id,
            name: name,
            price: price,
            quantity: quantity,
            storeName: storeName,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$GroceryItemsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {recipeItemsRefs = false, shoppingListItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (recipeItemsRefs) db.recipeItems,
                if (shoppingListItemsRefs) db.shoppingListItems
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (recipeItemsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$GroceryItemsTableReferences
                            ._recipeItemsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GroceryItemsTableReferences(db, table, p0)
                                .recipeItemsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.groceryItemId == item.id),
                        typedResults: items),
                  if (shoppingListItemsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$GroceryItemsTableReferences
                            ._shoppingListItemsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GroceryItemsTableReferences(db, table, p0)
                                .shoppingListItemsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.groceryItemId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$GroceryItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GroceryItemsTable,
    GroceryItemData,
    $$GroceryItemsTableFilterComposer,
    $$GroceryItemsTableOrderingComposer,
    $$GroceryItemsTableAnnotationComposer,
    $$GroceryItemsTableCreateCompanionBuilder,
    $$GroceryItemsTableUpdateCompanionBuilder,
    (GroceryItemData, $$GroceryItemsTableReferences),
    GroceryItemData,
    PrefetchHooks Function({bool recipeItemsRefs, bool shoppingListItemsRefs})>;
typedef $$RecipesTableCreateCompanionBuilder = RecipesCompanion Function({
  required String name,
  Value<int> id,
});
typedef $$RecipesTableUpdateCompanionBuilder = RecipesCompanion Function({
  Value<String> name,
  Value<int> id,
});

final class $$RecipesTableReferences
    extends BaseReferences<_$AppDatabase, $RecipesTable, RecipeData> {
  $$RecipesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RecipeItemsTable, List<RecipeGroceryItemData>>
      _recipeItemsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.recipeItems,
              aliasName:
                  $_aliasNameGenerator(db.recipes.id, db.recipeItems.recipeId));

  $$RecipeItemsTableProcessedTableManager get recipeItemsRefs {
    final manager = $$RecipeItemsTableTableManager($_db, $_db.recipeItems)
        .filter((f) => f.recipeId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_recipeItemsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$RecipesTableFilterComposer
    extends Composer<_$AppDatabase, $RecipesTable> {
  $$RecipesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  Expression<bool> recipeItemsRefs(
      Expression<bool> Function($$RecipeItemsTableFilterComposer f) f) {
    final $$RecipeItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.recipeItems,
        getReferencedColumn: (t) => t.recipeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecipeItemsTableFilterComposer(
              $db: $db,
              $table: $db.recipeItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$RecipesTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipesTable> {
  $$RecipesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));
}

class $$RecipesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipesTable> {
  $$RecipesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  Expression<T> recipeItemsRefs<T extends Object>(
      Expression<T> Function($$RecipeItemsTableAnnotationComposer a) f) {
    final $$RecipeItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.recipeItems,
        getReferencedColumn: (t) => t.recipeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecipeItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.recipeItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$RecipesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RecipesTable,
    RecipeData,
    $$RecipesTableFilterComposer,
    $$RecipesTableOrderingComposer,
    $$RecipesTableAnnotationComposer,
    $$RecipesTableCreateCompanionBuilder,
    $$RecipesTableUpdateCompanionBuilder,
    (RecipeData, $$RecipesTableReferences),
    RecipeData,
    PrefetchHooks Function({bool recipeItemsRefs})> {
  $$RecipesTableTableManager(_$AppDatabase db, $RecipesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> name = const Value.absent(),
            Value<int> id = const Value.absent(),
          }) =>
              RecipesCompanion(
            name: name,
            id: id,
          ),
          createCompanionCallback: ({
            required String name,
            Value<int> id = const Value.absent(),
          }) =>
              RecipesCompanion.insert(
            name: name,
            id: id,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$RecipesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({recipeItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (recipeItemsRefs) db.recipeItems],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (recipeItemsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$RecipesTableReferences._recipeItemsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RecipesTableReferences(db, table, p0)
                                .recipeItemsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.recipeId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$RecipesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RecipesTable,
    RecipeData,
    $$RecipesTableFilterComposer,
    $$RecipesTableOrderingComposer,
    $$RecipesTableAnnotationComposer,
    $$RecipesTableCreateCompanionBuilder,
    $$RecipesTableUpdateCompanionBuilder,
    (RecipeData, $$RecipesTableReferences),
    RecipeData,
    PrefetchHooks Function({bool recipeItemsRefs})>;
typedef $$RecipeItemsTableCreateCompanionBuilder = RecipeItemsCompanion
    Function({
  Value<int> id,
  required int groceryItemId,
  required int recipeId,
});
typedef $$RecipeItemsTableUpdateCompanionBuilder = RecipeItemsCompanion
    Function({
  Value<int> id,
  Value<int> groceryItemId,
  Value<int> recipeId,
});

final class $$RecipeItemsTableReferences extends BaseReferences<_$AppDatabase,
    $RecipeItemsTable, RecipeGroceryItemData> {
  $$RecipeItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $GroceryItemsTable _groceryItemIdTable(_$AppDatabase db) =>
      db.groceryItems.createAlias($_aliasNameGenerator(
          db.recipeItems.groceryItemId, db.groceryItems.id));

  $$GroceryItemsTableProcessedTableManager get groceryItemId {
    final manager = $$GroceryItemsTableTableManager($_db, $_db.groceryItems)
        .filter((f) => f.id($_item.groceryItemId));
    final item = $_typedResult.readTableOrNull(_groceryItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $RecipesTable _recipeIdTable(_$AppDatabase db) =>
      db.recipes.createAlias(
          $_aliasNameGenerator(db.recipeItems.recipeId, db.recipes.id));

  $$RecipesTableProcessedTableManager get recipeId {
    final manager = $$RecipesTableTableManager($_db, $_db.recipes)
        .filter((f) => f.id($_item.recipeId));
    final item = $_typedResult.readTableOrNull(_recipeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$RecipeItemsTableFilterComposer
    extends Composer<_$AppDatabase, $RecipeItemsTable> {
  $$RecipeItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  $$GroceryItemsTableFilterComposer get groceryItemId {
    final $$GroceryItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groceryItemId,
        referencedTable: $db.groceryItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroceryItemsTableFilterComposer(
              $db: $db,
              $table: $db.groceryItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$RecipesTableFilterComposer get recipeId {
    final $$RecipesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.recipeId,
        referencedTable: $db.recipes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecipesTableFilterComposer(
              $db: $db,
              $table: $db.recipes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RecipeItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipeItemsTable> {
  $$RecipeItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  $$GroceryItemsTableOrderingComposer get groceryItemId {
    final $$GroceryItemsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groceryItemId,
        referencedTable: $db.groceryItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroceryItemsTableOrderingComposer(
              $db: $db,
              $table: $db.groceryItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$RecipesTableOrderingComposer get recipeId {
    final $$RecipesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.recipeId,
        referencedTable: $db.recipes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecipesTableOrderingComposer(
              $db: $db,
              $table: $db.recipes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RecipeItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipeItemsTable> {
  $$RecipeItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$GroceryItemsTableAnnotationComposer get groceryItemId {
    final $$GroceryItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groceryItemId,
        referencedTable: $db.groceryItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroceryItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.groceryItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$RecipesTableAnnotationComposer get recipeId {
    final $$RecipesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.recipeId,
        referencedTable: $db.recipes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecipesTableAnnotationComposer(
              $db: $db,
              $table: $db.recipes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RecipeItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RecipeItemsTable,
    RecipeGroceryItemData,
    $$RecipeItemsTableFilterComposer,
    $$RecipeItemsTableOrderingComposer,
    $$RecipeItemsTableAnnotationComposer,
    $$RecipeItemsTableCreateCompanionBuilder,
    $$RecipeItemsTableUpdateCompanionBuilder,
    (RecipeGroceryItemData, $$RecipeItemsTableReferences),
    RecipeGroceryItemData,
    PrefetchHooks Function({bool groceryItemId, bool recipeId})> {
  $$RecipeItemsTableTableManager(_$AppDatabase db, $RecipeItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipeItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipeItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipeItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> groceryItemId = const Value.absent(),
            Value<int> recipeId = const Value.absent(),
          }) =>
              RecipeItemsCompanion(
            id: id,
            groceryItemId: groceryItemId,
            recipeId: recipeId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int groceryItemId,
            required int recipeId,
          }) =>
              RecipeItemsCompanion.insert(
            id: id,
            groceryItemId: groceryItemId,
            recipeId: recipeId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RecipeItemsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({groceryItemId = false, recipeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (groceryItemId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.groceryItemId,
                    referencedTable:
                        $$RecipeItemsTableReferences._groceryItemIdTable(db),
                    referencedColumn:
                        $$RecipeItemsTableReferences._groceryItemIdTable(db).id,
                  ) as T;
                }
                if (recipeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.recipeId,
                    referencedTable:
                        $$RecipeItemsTableReferences._recipeIdTable(db),
                    referencedColumn:
                        $$RecipeItemsTableReferences._recipeIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$RecipeItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RecipeItemsTable,
    RecipeGroceryItemData,
    $$RecipeItemsTableFilterComposer,
    $$RecipeItemsTableOrderingComposer,
    $$RecipeItemsTableAnnotationComposer,
    $$RecipeItemsTableCreateCompanionBuilder,
    $$RecipeItemsTableUpdateCompanionBuilder,
    (RecipeGroceryItemData, $$RecipeItemsTableReferences),
    RecipeGroceryItemData,
    PrefetchHooks Function({bool groceryItemId, bool recipeId})>;
typedef $$ShoppingListsTableCreateCompanionBuilder = ShoppingListsCompanion
    Function({
  Value<int> id,
  required String name,
});
typedef $$ShoppingListsTableUpdateCompanionBuilder = ShoppingListsCompanion
    Function({
  Value<int> id,
  Value<String> name,
});

final class $$ShoppingListsTableReferences extends BaseReferences<_$AppDatabase,
    $ShoppingListsTable, ShoppingListData> {
  $$ShoppingListsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ShoppingListItemsTable,
      List<ShoppingListItemsData>> _shoppingListItemsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.shoppingListItems,
          aliasName: $_aliasNameGenerator(
              db.shoppingLists.id, db.shoppingListItems.shoppingListId));

  $$ShoppingListItemsTableProcessedTableManager get shoppingListItemsRefs {
    final manager =
        $$ShoppingListItemsTableTableManager($_db, $_db.shoppingListItems)
            .filter((f) => f.shoppingListId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_shoppingListItemsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ShoppingListsTableFilterComposer
    extends Composer<_$AppDatabase, $ShoppingListsTable> {
  $$ShoppingListsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  Expression<bool> shoppingListItemsRefs(
      Expression<bool> Function($$ShoppingListItemsTableFilterComposer f) f) {
    final $$ShoppingListItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.shoppingListItems,
        getReferencedColumn: (t) => t.shoppingListId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ShoppingListItemsTableFilterComposer(
              $db: $db,
              $table: $db.shoppingListItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ShoppingListsTableOrderingComposer
    extends Composer<_$AppDatabase, $ShoppingListsTable> {
  $$ShoppingListsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));
}

class $$ShoppingListsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ShoppingListsTable> {
  $$ShoppingListsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> shoppingListItemsRefs<T extends Object>(
      Expression<T> Function($$ShoppingListItemsTableAnnotationComposer a) f) {
    final $$ShoppingListItemsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.shoppingListItems,
            getReferencedColumn: (t) => t.shoppingListId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ShoppingListItemsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.shoppingListItems,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$ShoppingListsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ShoppingListsTable,
    ShoppingListData,
    $$ShoppingListsTableFilterComposer,
    $$ShoppingListsTableOrderingComposer,
    $$ShoppingListsTableAnnotationComposer,
    $$ShoppingListsTableCreateCompanionBuilder,
    $$ShoppingListsTableUpdateCompanionBuilder,
    (ShoppingListData, $$ShoppingListsTableReferences),
    ShoppingListData,
    PrefetchHooks Function({bool shoppingListItemsRefs})> {
  $$ShoppingListsTableTableManager(_$AppDatabase db, $ShoppingListsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShoppingListsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShoppingListsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShoppingListsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              ShoppingListsCompanion(
            id: id,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              ShoppingListsCompanion.insert(
            id: id,
            name: name,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ShoppingListsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({shoppingListItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (shoppingListItemsRefs) db.shoppingListItems
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (shoppingListItemsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ShoppingListsTableReferences
                            ._shoppingListItemsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ShoppingListsTableReferences(db, table, p0)
                                .shoppingListItemsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.shoppingListId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ShoppingListsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ShoppingListsTable,
    ShoppingListData,
    $$ShoppingListsTableFilterComposer,
    $$ShoppingListsTableOrderingComposer,
    $$ShoppingListsTableAnnotationComposer,
    $$ShoppingListsTableCreateCompanionBuilder,
    $$ShoppingListsTableUpdateCompanionBuilder,
    (ShoppingListData, $$ShoppingListsTableReferences),
    ShoppingListData,
    PrefetchHooks Function({bool shoppingListItemsRefs})>;
typedef $$ShoppingListItemsTableCreateCompanionBuilder
    = ShoppingListItemsCompanion Function({
  Value<int> id,
  required int groceryItemId,
  required int shoppingListId,
});
typedef $$ShoppingListItemsTableUpdateCompanionBuilder
    = ShoppingListItemsCompanion Function({
  Value<int> id,
  Value<int> groceryItemId,
  Value<int> shoppingListId,
});

final class $$ShoppingListItemsTableReferences extends BaseReferences<
    _$AppDatabase, $ShoppingListItemsTable, ShoppingListItemsData> {
  $$ShoppingListItemsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $GroceryItemsTable _groceryItemIdTable(_$AppDatabase db) =>
      db.groceryItems.createAlias($_aliasNameGenerator(
          db.shoppingListItems.groceryItemId, db.groceryItems.id));

  $$GroceryItemsTableProcessedTableManager get groceryItemId {
    final manager = $$GroceryItemsTableTableManager($_db, $_db.groceryItems)
        .filter((f) => f.id($_item.groceryItemId));
    final item = $_typedResult.readTableOrNull(_groceryItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ShoppingListsTable _shoppingListIdTable(_$AppDatabase db) =>
      db.shoppingLists.createAlias($_aliasNameGenerator(
          db.shoppingListItems.shoppingListId, db.shoppingLists.id));

  $$ShoppingListsTableProcessedTableManager get shoppingListId {
    final manager = $$ShoppingListsTableTableManager($_db, $_db.shoppingLists)
        .filter((f) => f.id($_item.shoppingListId));
    final item = $_typedResult.readTableOrNull(_shoppingListIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ShoppingListItemsTableFilterComposer
    extends Composer<_$AppDatabase, $ShoppingListItemsTable> {
  $$ShoppingListItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  $$GroceryItemsTableFilterComposer get groceryItemId {
    final $$GroceryItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groceryItemId,
        referencedTable: $db.groceryItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroceryItemsTableFilterComposer(
              $db: $db,
              $table: $db.groceryItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ShoppingListsTableFilterComposer get shoppingListId {
    final $$ShoppingListsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.shoppingListId,
        referencedTable: $db.shoppingLists,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ShoppingListsTableFilterComposer(
              $db: $db,
              $table: $db.shoppingLists,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ShoppingListItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $ShoppingListItemsTable> {
  $$ShoppingListItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  $$GroceryItemsTableOrderingComposer get groceryItemId {
    final $$GroceryItemsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groceryItemId,
        referencedTable: $db.groceryItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroceryItemsTableOrderingComposer(
              $db: $db,
              $table: $db.groceryItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ShoppingListsTableOrderingComposer get shoppingListId {
    final $$ShoppingListsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.shoppingListId,
        referencedTable: $db.shoppingLists,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ShoppingListsTableOrderingComposer(
              $db: $db,
              $table: $db.shoppingLists,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ShoppingListItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ShoppingListItemsTable> {
  $$ShoppingListItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$GroceryItemsTableAnnotationComposer get groceryItemId {
    final $$GroceryItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groceryItemId,
        referencedTable: $db.groceryItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroceryItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.groceryItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ShoppingListsTableAnnotationComposer get shoppingListId {
    final $$ShoppingListsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.shoppingListId,
        referencedTable: $db.shoppingLists,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ShoppingListsTableAnnotationComposer(
              $db: $db,
              $table: $db.shoppingLists,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ShoppingListItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ShoppingListItemsTable,
    ShoppingListItemsData,
    $$ShoppingListItemsTableFilterComposer,
    $$ShoppingListItemsTableOrderingComposer,
    $$ShoppingListItemsTableAnnotationComposer,
    $$ShoppingListItemsTableCreateCompanionBuilder,
    $$ShoppingListItemsTableUpdateCompanionBuilder,
    (ShoppingListItemsData, $$ShoppingListItemsTableReferences),
    ShoppingListItemsData,
    PrefetchHooks Function({bool groceryItemId, bool shoppingListId})> {
  $$ShoppingListItemsTableTableManager(
      _$AppDatabase db, $ShoppingListItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShoppingListItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShoppingListItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShoppingListItemsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> groceryItemId = const Value.absent(),
            Value<int> shoppingListId = const Value.absent(),
          }) =>
              ShoppingListItemsCompanion(
            id: id,
            groceryItemId: groceryItemId,
            shoppingListId: shoppingListId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int groceryItemId,
            required int shoppingListId,
          }) =>
              ShoppingListItemsCompanion.insert(
            id: id,
            groceryItemId: groceryItemId,
            shoppingListId: shoppingListId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ShoppingListItemsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {groceryItemId = false, shoppingListId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (groceryItemId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.groceryItemId,
                    referencedTable: $$ShoppingListItemsTableReferences
                        ._groceryItemIdTable(db),
                    referencedColumn: $$ShoppingListItemsTableReferences
                        ._groceryItemIdTable(db)
                        .id,
                  ) as T;
                }
                if (shoppingListId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.shoppingListId,
                    referencedTable: $$ShoppingListItemsTableReferences
                        ._shoppingListIdTable(db),
                    referencedColumn: $$ShoppingListItemsTableReferences
                        ._shoppingListIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ShoppingListItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ShoppingListItemsTable,
    ShoppingListItemsData,
    $$ShoppingListItemsTableFilterComposer,
    $$ShoppingListItemsTableOrderingComposer,
    $$ShoppingListItemsTableAnnotationComposer,
    $$ShoppingListItemsTableCreateCompanionBuilder,
    $$ShoppingListItemsTableUpdateCompanionBuilder,
    (ShoppingListItemsData, $$ShoppingListItemsTableReferences),
    ShoppingListItemsData,
    PrefetchHooks Function({bool groceryItemId, bool shoppingListId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$GroceryItemsTableTableManager get groceryItems =>
      $$GroceryItemsTableTableManager(_db, _db.groceryItems);
  $$RecipesTableTableManager get recipes =>
      $$RecipesTableTableManager(_db, _db.recipes);
  $$RecipeItemsTableTableManager get recipeItems =>
      $$RecipeItemsTableTableManager(_db, _db.recipeItems);
  $$ShoppingListsTableTableManager get shoppingLists =>
      $$ShoppingListsTableTableManager(_db, _db.shoppingLists);
  $$ShoppingListItemsTableTableManager get shoppingListItems =>
      $$ShoppingListItemsTableTableManager(_db, _db.shoppingListItems);
}
