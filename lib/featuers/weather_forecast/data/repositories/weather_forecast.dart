import 'package:my_case/featuers/weather_forecast/data/datasources/weather_forecast_remote_data_source.dart';
import 'package:my_case/featuers/weather_forecast/domain/entities/weather_forcast.dart';
import 'package:my_case/featuers/weather_forecast/data/models/weather_forecast_model.dart';
import 'package:my_case/featuers/weather_forecast/domain/repositories/featherforecast_repositories.dart';

class WeatherForecastRepositoryImpl implements WeatherForecastRepository {
  final WeatherForecastRemoteDataSource remoteDataSource;

  WeatherForecastRepositoryImpl(this.remoteDataSource);

  Future<List<WeatherForecast>> getWeatherForecasts() async {
    return await remoteDataSource.getWeatherForecasts();
  }

  Future<WeatherForecast> getWeatherForecastById(int id) async {
    return await remoteDataSource.getWeatherForecastById(id);
  }

  Future<void> addWeatherForecast(WeatherForecast forecast) async {
    await remoteDataSource.addWeatherForecast(forecast as WeatherForecastModel);
  }

  Future<void> updateWeatherForecast(WeatherForecast forecast) async {
    await remoteDataSource
        .updateWeatherForecast(forecast as WeatherForecastModel);
  }

  Future<void> deleteWeatherForecast(int id) async {
    await remoteDataSource.deleteWeatherForecast(id);
  }

  @override
  Future<WeatherForecast> addForecast(WeatherForecast forecast) {
    // TODO: implement addForecast
    throw UnimplementedError();
  }

  @override
  Future<void> deleteForecast(String id) {
    // TODO: implement deleteForecast
    throw UnimplementedError();
  }

  @override
  Future<WeatherForecast> getForecastById(String id) {
    // TODO: implement getForecastById
    throw UnimplementedError();
  }

  @override
  Future<List<WeatherForecast>> getForecasts() {
    // TODO: implement getForecasts
    throw UnimplementedError();
  }

  @override
  Future<WeatherForecast> updateForecast(WeatherForecast forecast) {
    // TODO: implement updateForecast
    throw UnimplementedError();
  }
}
