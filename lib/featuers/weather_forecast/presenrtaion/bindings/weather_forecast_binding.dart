import 'package:get/get.dart';
import 'package:my_case/featuers/weather_forecast/data/datasources/weather_forecast_remote_data_source.dart';
import 'package:my_case/featuers/weather_forecast/data/repositories/weather_forecast.dart';
import 'package:my_case/featuers/weather_forecast/presenrtaion/controllers/weather_forecast_controller.dart';

class WeatherForecastBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
        WeatherForecastRemoteDataSource(baseUrl: "https://yourapi.com/api"));
    Get.put(WeatherForecastRepositoryImpl(
        Get.find<WeatherForecastRemoteDataSource>()));
    Get.put(
        WeatherForecastController(Get.find<WeatherForecastRepositoryImpl>()));
  }
}
