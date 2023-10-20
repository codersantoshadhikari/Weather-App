import 'package:weather_app/core/utilize/strings.dart';

class HourlyForecastModel {
  num maxWindSpeed;
  num humidity;
  num chanceOfRain;
  String forecastDate;
  String weatherName;
  String weatherIcon;
  num temperature;

  HourlyForecastModel({
    required this.maxWindSpeed,
    required this.humidity,
    required this.chanceOfRain,
    required this.forecastDate,
    required this.weatherName,
    required this.weatherIcon,
    required this.temperature,
  });

  factory HourlyForecastModel.fromJson(Map<String, dynamic> json) {
    final date = json[AppStrings.time];
    final String weatherName = json[AppStrings.condition][AppStrings.text];
    return HourlyForecastModel(
      forecastDate: date,
      maxWindSpeed: json[AppStrings.wind_kph],
      humidity: json[AppStrings.humidity],
      chanceOfRain: json[AppStrings.chance_of_rain],
      weatherName: weatherName,
      weatherIcon: weatherName.replaceAll(' ', '').toLowerCase(),
      temperature: json[AppStrings.temp_c],
    );
  }
}
