import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/data/source/database/database.dart';
import 'package:grocerapp/presentation/view/features/lists/add_items_page.dart';
import 'package:grocerapp/presentation/view/features/login/login_page.dart';
import 'package:beamer/beamer.dart';
import 'package:grocerapp/presentation/view/features/recipes/recipe_detail_page.dart';
import 'package:grocerapp/presentation/view/main_screen.dart';

class App extends StatelessWidget {
  App({super.key});
  final routerDelegate = BeamerDelegate(
    transitionDelegate: const NoAnimationTransitionDelegate(),
    locationBuilder: RoutesLocationBuilder(routes: {
      '/': (context, state, data) => const LoginPage(),
      '/main_page': (context, state, data) => const MainView(),
      '/add_items_to_list': (context, state, data) =>
          AddItemsPage(listData: data as ShoppingListData),
      '/recipe_details_page': (context, state, data) =>
          RecipeDetailPage(listData: data as RecipeData),
    }).call,
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        title: 'GrocerApp',
        routeInformationParser: BeamerParser(),
        routerDelegate: routerDelegate,
        backButtonDispatcher: BeamerBackButtonDispatcher(
          delegate: routerDelegate,
          alwaysBeamBack: true,
        ),
      ),
    );
  }
}
