// lib/data/remote/api_client.dart
import 'package:http/http.dart' as http;
import '../../core/constants/api_constants.dart';

class ApiClient {
  final String _baseUrl = ApiConstants.baseUrl;
  final String _apiKey = ApiConstants.apiKey;
  final http.Client _client;

  ApiClient({http.Client? client}) : _client = client ?? http.Client();

  /// Performs a GET request to the specified [endpoint] with optional [params].
  Future<http.Response> get(String endpoint,
      {Map<String, String>? params}) async {
    final uri = Uri.parse('$_baseUrl$endpoint').replace(queryParameters: {
      'apiKey': _apiKey,
      if (params != null) ...params,
    });

    try {
      final response = await _client.get(uri, headers: _headers);
      _checkForErrors(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> getRecipeIngredients(
      String endpoint, String ingredientId,
      {Map<String, String>? params}) async {
    final baseUri =
        'https://api.spoonacular.com/recipes/$ingredientId/information?includeNutrition=false';
    final uri = Uri.parse(baseUri).replace(queryParameters: {
      'apiKey': _apiKey,
      if (params != null) ...params,
    });

    try {
      final response = await _client.get(uri, headers: _headers);
      _checkForErrors(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  final _headers = {
    'X-Mashape-Key': ApiConstants.apiKey,
    'X-Mashape-Host': 'mashape host',
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  void _checkForErrors(http.Response response) {
    if (response.statusCode >= 400) {
      throw HttpException(
        'Request failed with status: ${response.statusCode}',
        uri: response.request?.url,
      );
    }
  }

  void dispose() {
    _client.close();
  }
}

class HttpException implements Exception {
  final String message;
  final Uri? uri;

  HttpException(this.message, {this.uri});

  @override
  String toString() => 'HttpException: $message, URI: $uri';
}
