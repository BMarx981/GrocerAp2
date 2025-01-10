import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/presentation/view/features/app_bar/app_bar.dart';

class ShoppingListDetailView extends ConsumerStatefulWidget {
  const ShoppingListDetailView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ShoppingListDetailViewState();
}

class _ShoppingListDetailViewState
    extends ConsumerState<ShoppingListDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GrocerAppbar(),
      body: Container(),
    );
  }
}
