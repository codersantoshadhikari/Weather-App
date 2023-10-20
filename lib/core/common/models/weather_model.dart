import 'current_model.dart';
import 'daily_forecast_model.dart';
import 'hourly_forecast_model.dart';

class WeatherModel {
  String location;
  CurrentModel currentWeather;
  List<DailyForecastModel> dailyWeatherForecast;

  List<HourlyForecastModel> hourlyWeatherForecast = [];

  WeatherModel({
    required this.location,
    required this.currentWeather,
    required this.dailyWeatherForecast,
    required this.hourlyWeatherForecast,
  });
}
