import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/common/models/hourly_forecast_model.dart';
import 'package:weather_app/core/common/models/weather_model.dart';

import '../../../../core/common/models/current_model.dart';
import '../../../../core/common/models/daily_forecast_model.dart';
import '../../../../core/services/api_services.dart';
import '../../../../core/utilize/strings.dart';
import 'home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl({required this.apiServices});

  @override
  Future<WeatherModel> fetchData(String searchText) async {
    try {
      final searchResult = await apiServices.get(
        AppStrings.searchWeatherAPI + searchText,
      );

      final String location = _handleLocation(searchResult);
      final current = _handleCurrent(searchResult);
      final List allForecasts =
          searchResult[AppStrings.forecast][AppStrings.forecastday];
      final dailyForecasts = _handleDailyForecasts(allForecasts);
      final hourlyForecasts = _handleHourlyForecasts(allForecasts);

      final weatherData = WeatherModel(
        location: location,
        currentWeather: current,
        dailyWeatherForecast: dailyForecasts,
        hourlyWeatherForecast: hourlyForecasts,
      );

      return weatherData;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  String _handleLocation(dynamic searchResult) {
    return searchResult[AppStrings.location][AppStrings.name];
  }

  CurrentModel _handleCurrent(dynamic searchResult) {
    final currentData = CurrentModel.fromJson(searchResult[AppStrings.current]);
    final locationData = searchResult[AppStrings.location];
    currentData.lastUpdated = _handleDate(locationData);
    return currentData;
  }

  String _handleDate(locationData) {
    var parsedDate =
        DateTime.parse(locationData[AppStrings.localtime].substring(0, 10));
    var newDate = DateFormat('MMMMEEEEd').format(parsedDate);
    return newDate;
  }

  List<DailyForecastModel> _handleDailyForecasts(List allDailyForecasts) {
    final List<DailyForecastModel> dailyForecasts = [];
    for (int i = 0; i < min(3, allDailyForecasts.length); i++) {
      dailyForecasts.add(DailyForecastModel.fromJson(allDailyForecasts[i]));
    }
    return dailyForecasts;
  }

  List<HourlyForecastModel> _handleHourlyForecasts(List allForecasts) {
    final List hourlyForecasts = allForecasts[0][AppStrings.hour];
    final List<HourlyForecastModel> hourlyWeatherForecast = [];
    for (int i = 0; i < hourlyForecasts.length; i++) {
      final hourlyForecast = HourlyForecastModel.fromJson(hourlyForecasts[i]);
      hourlyWeatherForecast.add(hourlyForecast);
    }
    return hourlyWeatherForecast;
  }
}
