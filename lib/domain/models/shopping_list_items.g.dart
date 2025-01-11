// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_list_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingListItems _$ShoppingListItemsFromJson(Map<String, dynamic> json) =>
    ShoppingListItems(
      items: (json['items'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ShoppingListItemsToJson(ShoppingListItems instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
