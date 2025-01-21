// lib/data/remote/services/recipe_service.dart
import 'dart:convert';
import 'package:grocerapp/data/remote/client.dart';

import '../models/recipe_response.dart';

class RecipeService {
  final ApiClient _apiClient;

  RecipeService(this._apiClient);

  /// Fetches recipes using the complexSearch endpoint with optional [query] and [parameters].
  Future<RecipeResponse> fetchRecipes({
    String? query,
    int? number,
    List<String>? includeIngredients,
    List<String>? excludeIngredients,
    String? cuisine,
    String? diet,
    String? intolerances,
  }) async {
    final params = <String, String>{
      if (query != null) 'query': query,
      if (number != null) 'number': number.toString(),
      if (includeIngredients != null && includeIngredients.isNotEmpty)
        'includeIngredients': includeIngredients.join(','),
      if (excludeIngredients != null && excludeIngredients.isNotEmpty)
        'excludeIngredients': excludeIngredients.join(','),
      if (cuisine != null) 'cuisine': cuisine,
      if (diet != null) 'diet': diet,
      if (intolerances != null) 'intolerances': intolerances,
    };

    final response = await _apiClient.get('/recipes/complexSearch', params: params);
    final Map<String, dynamic> data = json.decode(response.body);
    return RecipeResponse.fromJson(data);
  }
}
