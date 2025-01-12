import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/presentation/view/features/recipes/components/recipe_details_widget.dart';

void main() {
  testWidgets('RecipeDetailsWidget displays the name correctly',
      (WidgetTester tester) async {
    const recipeName = 'Chocolate Cake';

    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: RecipeDetailsWidget(name: recipeName),
          ),
        ),
      ),
    );

    expect(find.text(recipeName), findsOneWidget);
  });

  testWidgets('RecipeDetailsWidget has correct style and layout',
      (WidgetTester tester) async {
    const recipeName = 'Apple Pie';

    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: RecipeDetailsWidget(name: recipeName),
          ),
        ),
      ),
    );

    expect(find.byKey(const Key('recipe_detail_name')), findsOneWidget);

    final containerFinder = find.descendant(
      of: find.byType(RecipeDetailsWidget),
      matching: find.byKey(const Key('recipe_detail_container')),
    );

    expect(containerFinder, findsOneWidget);

    final containerWidget = tester.widget<Container>(containerFinder);
    final decoration = containerWidget.decoration as BoxDecoration;
    expect(decoration.color, const Color.fromARGB(255, 17, 68, 109));
    expect(decoration.borderRadius, const BorderRadius.all(Radius.circular(4)));
  });
}
