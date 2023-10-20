// ignore_for_file: prefer_typing_uninitialized_variables

import '../../utilize/strings.dart';

class DailyForecastModel {
  num maxWindSpeed;
  num avgHumidity;
  num chanceOfRain;
  String forecastDate;

  var weatherName;
  String weatherIcon;
  num minTemperature;
  num maxTemperature;

  DailyForecastModel({
    required this.maxWindSpeed,
    required this.avgHumidity,
    required this.chanceOfRain,
    required this.forecastDate,
    required this.weatherName,
    required this.weatherIcon,
    required this.minTemperature,
    required this.maxTemperature,
  });

  factory DailyForecastModel.fromJson(Map<String, dynamic> json) {
    final day = json[AppStrings.day];
    final date = json[AppStrings.date];
    final String weatherName = day[AppStrings.condition][AppStrings.text];
    return DailyForecastModel(
      forecastDate: date,
      maxWindSpeed: day[AppStrings.maxWindSpeed],
      avgHumidity: day[AppStrings.avgHumidity],
      chanceOfRain: day[AppStrings.daily_chance_of_rain],
      weatherName: weatherName,
      weatherIcon: weatherName.replaceAll(' ', '').toLowerCase(),
      minTemperature: day[AppStrings.mintemp_c],
      maxTemperature: day[AppStrings.maxtemp_c],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      AppStrings.maxWindSpeed: maxWindSpeed,
      AppStrings.avgHumidity: avgHumidity,
      AppStrings.daily_chance_of_rain: chanceOfRain,
      AppStrings.date: forecastDate,
      AppStrings.condition: {
        AppStrings.text: weatherName,
      },
      AppStrings.mintemp_c: minTemperature,
      AppStrings.maxtemp_c: maxTemperature,
    };
  }
}
