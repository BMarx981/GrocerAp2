import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shopping_list_items.g.dart';

@JsonSerializable()
class ShoppingListItems {
  final List<String> items;

  ShoppingListItems({required this.items});

  factory ShoppingListItems.fromJson(Map<String, dynamic> json) =>
      _$ShoppingListItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ShoppingListItemsToJson(this);

  static JsonTypeConverter<ShoppingListItems, String> converter =
      TypeConverter.json(
    fromJson: (json) =>
        ShoppingListItems.fromJson(json as Map<String, Object?>),
    toJson: (items) => items.toJson(),
  );
}
