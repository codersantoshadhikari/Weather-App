import '../../utilize/strings.dart';

class CurrentModel {
  String lastUpdated;
  num tempC;
  num tempF;
  String weatherName;
  String weatherIcon;
  num humidity;
  num cloud;

  num windSpeed;

  CurrentModel({
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.weatherName,
    required this.weatherIcon,
    required this.humidity,
    required this.cloud,
    required this.windSpeed,
  });

  factory CurrentModel.fromJson(Map<String, dynamic> json) {
    final String weatherName = json[AppStrings.condition][AppStrings.text];
    return CurrentModel(
      lastUpdated: json[AppStrings.last_updated],
      tempC: json[AppStrings.temp_c],
      tempF: json[AppStrings.temp_f],
      weatherName: weatherName,
      weatherIcon: weatherName.replaceAll(' ', '').toLowerCase(),
      humidity: json[AppStrings.humidity],
      cloud: json[AppStrings.cloud],
      windSpeed: json[AppStrings.wind_kph],
    );
  }
}
