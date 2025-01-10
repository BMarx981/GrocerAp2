import 'package:grocerapp/data/source/database/database.dart';

abstract class RecipeModel {
  int? get id;
  String? get name;
  final List<GroceryItemData> items;

  RecipeModel({required this.items});
}
