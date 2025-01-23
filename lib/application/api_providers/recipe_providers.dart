import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/data/remote/client.dart';
import 'package:grocerapp/data/remote/models/recipe_response.dart';
import 'package:grocerapp/data/remote/services/recipe_service.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});

final recipeServiceProvider = Provider<RecipeService>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return RecipeService(apiClient);
});

final recipeProvider = FutureProvider<RecipeResponse>((ref) {
  final recipeService = ref.read(recipeServiceProvider);
  return recipeService.fetchRecipes(query: 'pasta');
});
