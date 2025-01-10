import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/data/source/database/database.dart';
import 'package:grocerapp/domain/repository/lists_repository.dart';

class DetailsTileWidget extends ConsumerWidget {
  const DetailsTileWidget({
    super.key,
    required this.data,
  });

  final ShoppingListData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (_) {
        ref.read(listsRepositoryProvider.notifier).deleteList(data.id);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [
              Colors.black.withValues(alpha: .5),
              Colors.black45.withValues(alpha: .2)
            ],
          ),
        ),
        child: ListTile(
          iconColor: Colors.white,
          title: GestureDetector(
            onTap: () => Beamer.of(context).beamToNamed('/add_items_to_list',
                popToNamed: '/lists', data: data),
            child: Text(
              data.name!,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
