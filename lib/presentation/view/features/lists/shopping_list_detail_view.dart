import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/data/source/database/database.dart';
import 'package:grocerapp/presentation/view/features/app_bar/app_bar.dart';

class ShoppingListDetailView extends ConsumerStatefulWidget {
  ShoppingListDetailView({super.key, required this.data});

  final ShoppingListData data;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ShoppingListDetailViewState();
}

class _ShoppingListDetailViewState
    extends ConsumerState<ShoppingListDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GrocerAppbar(title: "${widget.data.name} list"),
      body: Column(children: [],),
    );
  }
}
