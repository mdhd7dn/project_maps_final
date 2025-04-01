import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_forecast_model.dart';

class WeatherForecastRemoteDataSource {
  final String baseUrl;

  WeatherForecastRemoteDataSource({required this.baseUrl});

  Future<List<WeatherForecastModel>> getWeatherForecasts() async {
    final response = await http.get(Uri.parse('$baseUrl/weather'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((item) => WeatherForecastModel.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load weather forecasts');
    }
  }

  Future<WeatherForecastModel> getWeatherForecastById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/weather/$id'));

    if (response.statusCode == 200) {
      return WeatherForecastModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather forecast');
    }
  }

  Future<void> addWeatherForecast(WeatherForecastModel forecast) async {
    final response = await http.post(
      Uri.parse('$baseUrl/weather'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(forecast.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add weather forecast');
    }
  }

  Future<void> deleteWeatherForecast(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/weather/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete weather forecast');
    }
  }

  Future<void> updateWeatherForecast(WeatherForecastModel forecast) async {
    final response = await http.put(
      Uri.parse('$baseUrl/weather/${forecast.date.toIso8601String()}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(forecast.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update weather forecast');
    }
  }
}
