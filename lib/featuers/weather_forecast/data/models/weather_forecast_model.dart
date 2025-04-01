import 'package:my_case/featuers/weather_forecast/domain/entities/weather_forcast.dart';

class WeatherForecastModel extends WeatherForecast {
  WeatherForecastModel({
    required DateTime date,
    required int temperatureC,
    required int temperatureF,
    String? summary,
  }) : super(
          date: date,
          temperatureC: temperatureC,
          temperatureF: temperatureF,
          summary: summary,
        );

  factory WeatherForecastModel.fromJson(Map<String, dynamic> json) {
    return WeatherForecastModel(
      date: DateTime.parse(json['date']),
      temperatureC: json['temperatureC'],
      temperatureF: json['temperatureF'],
      summary: json['summary'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'temperatureC': temperatureC,
      'temperatureF': temperatureF,
      'summary': summary,
    };
  }
}
