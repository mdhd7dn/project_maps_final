import 'package:my_case/featuers/weather_forecast/domain/entities/weather_forcast.dart';

abstract class WeatherForecastRepository {
  Future<WeatherForecast> addForecast(WeatherForecast forecast);
  Future<List<WeatherForecast>> getForecasts();
  Future<WeatherForecast> getForecastById(String id);
  Future<void> deleteForecast(String id);
  Future<WeatherForecast> updateForecast(WeatherForecast forecast);
}
