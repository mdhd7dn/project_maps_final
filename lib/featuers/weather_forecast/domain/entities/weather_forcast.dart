class WeatherForecast {
  final DateTime date;
  final int temperatureC; // درجة الحرارة المئوية
  final int temperatureF; // درجة الحرارة بالفهرنهايت
  final String? summary; // وصف الحالة الجوية

  WeatherForecast({
    required this.date,
    required this.temperatureC,
    required this.temperatureF,
    this.summary,
  });
}
