import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/domain/repository/grocery_item_repository.dart';
import 'package:grocerapp/presentation/common_widgets/add_item_dialog.dart';
import 'package:grocerapp/presentation/common_widgets/edit_item_dialog.dart';
import 'package:grocerapp/presentation/common_widgets/error_message_widget.dart';
import 'package:grocerapp/presentation/view/features/dashboard/components/dashboard_title_widget.dart';

class RecentItemsGridWidget extends ConsumerWidget {
  const RecentItemsGridWidget({
    super.key,
  });
  final whiteTextStyle = const TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(groceryItemRepositoryProvider);
    return provider.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, stackTrace) => ErrorMessageWidget(e.toString()),
        data: (data) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue.withValues(alpha: .7),
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          DashboardTitleWidget(
                              title: "Recent Items",
                              addFunction: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => const AddItemWidget(),
                                );
                              }),
                          Expanded(
                            child: ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) =>
                                          EditItemWidget(data: data[index]),
                                    );
                                  },
                                  child: Dismissible(
                                    key: Key(data[index].id.toString()),
                                    onDismissed: (_) {
                                      ref
                                          .read(groceryItemRepositoryProvider
                                              .notifier)
                                          .deleteItem(data[index].id);
                                    },
                                    child: Semantics(
                                      label: 'Recent item ${data[index].name}',
                                      hint: 'Tap here to edit this item',
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(16),
                                                bottomRight:
                                                    Radius.circular(16)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black,
                                                blurRadius: 5,
                                                offset: Offset(4, 4),
                                              )
                                            ],
                                          ),
                                          child: Wrap(children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  "Name: ${data[index].name}",
                                                  style: whiteTextStyle),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  "Price: ${data[index].price.toString()}",
                                                  style: whiteTextStyle),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  "Qunatity: ${data[index].quantity.toString()}",
                                                  style: whiteTextStyle),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  "Store: ${data[index].storeName}",
                                                  style: whiteTextStyle),
                                            ),
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
