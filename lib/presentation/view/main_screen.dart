import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/application/bottom_nav_provider/bottom_nav_provider.dart';
import 'package:grocerapp/presentation/view/features/app_bar/app_bar.dart';
import 'package:grocerapp/presentation/view/features/bottom_nav_bar/bottom_nav_bar_widget.dart';
import 'package:grocerapp/presentation/view/features/dashboard/dashboard_page.dart';
import 'package:grocerapp/presentation/view/features/lists/lists_page.dart';
import 'package:grocerapp/presentation/view/features/recipes/recipes_page.dart';

class MainView extends ConsumerWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);
    return Scaffold(
      appBar: GrocerAppbar(
        title: getPageName(currentIndex),
        showLogOut: true,
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [const DashboardPage(), ListsPage(), RecipesPage()],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

String getPageName(int index) {
  switch (index) {
    case 0:
      return "Dashboard";
    case 1:
      return "Shopping lists";
    case 2:
      return "Recipes";
    default:
      return "Dashboard";
  }
}
