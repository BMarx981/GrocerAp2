// lib/data/remote/models/recipe_response.dart

import 'package:grocerapp/domain/models/recipe.dart';

class RecipeResponse {
  final int? offset;
  final int? number;
  final int? totalResults;
  final List<Recipe> results;

  RecipeResponse({
    this.offset,
    this.number,
    this.totalResults,
    required this.results,
  });

  factory RecipeResponse.fromJson(Map<String, dynamic> json) {
    return RecipeResponse(
      offset: json['offset'] as int?,
      number: json['number'] as int?,
      totalResults: json['totalResults'] as int?,
      results: (json['results'] as List<dynamic>)
          .map((item) => Recipe.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
