import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/application/bottom_nav_provider/bottom_nav_provider.dart';
import 'package:grocerapp/domain/repository/lists_repository.dart';
import 'package:grocerapp/presentation/common_widgets/add_list_dialog.dart';
import 'package:grocerapp/presentation/common_widgets/error_message_widget.dart';
import 'package:grocerapp/presentation/view/features/dashboard/components/dashboard_title_widget.dart';

class RecentListsGridWidget extends ConsumerWidget {
  const RecentListsGridWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(listsRepositoryProvider);
    return provider.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (e, stackTrace) => ErrorMessageWidget(e.toString()),
      data: (data) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.lightBlue.withValues(alpha: .7),
              border: Border.all(color: Colors.black),
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
                            title: "Recent Lists",
                            addFunction: () {
                              showDialog(
                                context: context,
                                builder: (context) => AddListWidget(),
                              );
                            }),
                        Expanded(
                          child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return Dismissible(
                                key: UniqueKey(),
                                onDismissed: (direction) {
                                  ref
                                      .read(listsRepositoryProvider.notifier)
                                      .deleteList(data[index].id);
                                },
                                child: GestureDetector(
                                  onTap: () {
                                    ref
                                        .read(bottomNavProvider.notifier)
                                        .bottomNavSelected(1);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                                Colors.white
                                                    .withValues(alpha: .8),
                                                Colors.white
                                                    .withValues(alpha: .6)
                                              ]),
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              border: Border.all(
                                                  width: 2,
                                                  color: Colors.white),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(data[index].name),
                                            ),
                                          ),
                                        ),
                                      ],
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
      },
    );
  }
}
