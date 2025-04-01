import 'package:get/get.dart';
import 'package:my_case/featuers/weather_forecast/data/repositories/weather_forecast.dart';
import 'package:my_case/featuers/weather_forecast/domain/entities/weather_forcast.dart';

class WeatherForecastController extends GetxController {
  final WeatherForecastRepositoryImpl repository;

  WeatherForecastController(this.repository);

  RxList<WeatherForecast> forecasts = <WeatherForecast>[].obs;
  RxBool loading = true.obs;

  @override
  void onInit() {
    fetchWeatherForecasts();
    super.onInit();
  }

  Future<void> fetchWeatherForecasts() async {
    try {
      loading.value = true;
      forecasts.value = await repository.getWeatherForecasts();
    } finally {
      loading.value = false;
    }
  }

  Future<void> addWeatherForecast(WeatherForecast forecast) async {
    try {
      await repository.addWeatherForecast(forecast);
      forecasts.add(forecast);
    } catch (e) {
      print("Error adding weather forecast: $e");
    }
  }

  Future<void> updateWeatherForecast(WeatherForecast forecast) async {
    try {
      await repository.updateWeatherForecast(forecast);
      int index = forecasts.indexWhere((f) => f.date == forecast.date);
      if (index != -1) {
        forecasts[index] = forecast;
      }
    } catch (e) {
      print("Error updating weather forecast: $e");
    }
  }

  Future<void> deleteWeatherForecast(int id) async {
    try {
      await repository.deleteWeatherForecast(id);
      forecasts.removeWhere((f) => f.date == id);
    } catch (e) {
      print("Error deleting weather forecast: $e");
    }
  }
}
