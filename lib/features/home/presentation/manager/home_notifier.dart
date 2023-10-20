import 'package:flutter/material.dart';
import '../../../../core/common/models/current_model.dart';
import '../../../../core/common/models/weather_model.dart';
import '../../../../core/utilize/service_locator.dart';
import '../../data/repositories/home_repo_impl.dart';

class HomeNotifier extends ChangeNotifier {
  final HomeRepoImpl homeRepoImpl = getIt<HomeRepoImpl>();
  final TextEditingController cityController = TextEditingController();

  WeatherModel weatherModel = WeatherModel(
    location: 'Cairo',
    currentWeather: CurrentModel(
      cloud: 0,
      weatherIcon: 'heavycloudy',
      weatherName: '',
      humidity: 0,
      lastUpdated: '',
      tempC: 0,
      tempF: 0,
      windSpeed: 0,
    ),
    dailyWeatherForecast: [],
    hourlyWeatherForecast: [],
  );

  //API Call

  void fetchWeatherData() async {
    String searchText = cityController.text.isNotEmpty
        ? cityController.text
        : weatherModel.location;
    try {
      weatherModel = await homeRepoImpl.fetchData(searchText);

      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static String getShortLocationName(String s) {
    List<String> wordList = s.split(" ");

    if (wordList.isNotEmpty) {
      if (wordList.length > 1) {
        return "${wordList[0]} ${wordList[1]}";
      } else {
        return wordList[0];
      }
    } else {
      return " ";
    }
  }
}
