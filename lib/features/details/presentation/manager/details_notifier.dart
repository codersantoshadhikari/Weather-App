import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/common/models/daily_forecast_model.dart';
import '../../../../core/common/models/weather_model.dart';
import '../../../../core/utilize/strings.dart';

class DetailsNotifier extends ChangeNotifier {
  late WeatherModel weatherModel;
  Map getForecastWeather(int index) {
    final List<DailyForecastModel> dailyWeatherForecast =
        weatherModel.dailyWeatherForecast;
    num maxWindSpeed = dailyWeatherForecast[index].maxWindSpeed;
    num avgHumidity = dailyWeatherForecast[index].avgHumidity;
    num chanceOfRain = dailyWeatherForecast[index].chanceOfRain;
    var parsedDate = DateTime.parse(dailyWeatherForecast[index].forecastDate);
    var forecastDate = DateFormat('EEEE, d MMMM').format(parsedDate);
    String weatherName = dailyWeatherForecast[index].weatherName;
    num minTemperature = dailyWeatherForecast[index].minTemperature;
    num maxTemperature = dailyWeatherForecast[index].maxTemperature;

    var forecastData = {
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
    return forecastData;
  }
}
