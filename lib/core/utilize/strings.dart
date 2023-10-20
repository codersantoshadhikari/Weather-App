// ignore_for_file: constant_identifier_names

class AppStrings {
  static const String apiKey = 'f6957389021343e5a77145315230601';
  static String searchWeatherAPI =
      "https://api.weatherapi.com/v1/forecast.json?key=${AppStrings.apiKey}&days=7&q=";

  //  API Call
  // forecast
  static const String location = 'location';
  static const String name = 'name';
  static const String localtime = 'localtime';
  static const String current = 'current';
  static const String condition = 'condition';
  static const String text = 'text';
  static const String temp_c = 'temp_c';
  static const String wind_kph = 'wind_kph';
  static const String humidity = 'humidity';
  static const String cloud = 'cloud';
  static const String forecast = 'forecast';
  static const String forecastday = 'forecastday';
  static const String hour = 'hour';
  static const String maxWindSpeed = 'maxwind_kph';
  static const String avgHumidity = 'avghumidity';
  static const String daily_chance_of_rain = 'daily_chance_of_rain';
  static const String chance_of_rain = 'chance_of_rain';
  static const String date = 'date';
  static const String mintemp_c = 'mintemp_c';
  static const String maxtemp_c = 'maxtemp_c';
  static const String conditionText = 'text';
  static const String conditionIcon = 'icon';
  static const String day = 'day';
  static const String time = 'time';

  // current
  static const String last_updated = 'last_updated';
  static const String temp_f = 'temp_f';

  // weather model

  static const String hourlyWeatherForecast = 'hourlyWeatherForecast';
  static const String dailyForecast = 'dailyForecast';
}
