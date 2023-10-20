import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/common/models/hourly_forecast_model.dart';
import '../../../../../core/utilize/colors.dart';

class HourlyForecastCard extends StatelessWidget {
  const HourlyForecastCard({super.key, required this.forecast});

  final HourlyForecastModel forecast;

  @override
  Widget build(BuildContext context) {
    String currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
    String currentHour = currentTime.substring(0, 2);

    String forecastTime = forecast.forecastDate.substring(11, 16);
    String forecastHour = forecast.forecastDate.substring(11, 13);

    String forecastWeatherName = forecast.weatherName;
    String forecastWeatherIcon =
        "${forecastWeatherName.replaceAll(' ', '').toLowerCase()}.png";

    String forecastTemperature = forecast.temperature.round().toString();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      margin: const EdgeInsets.only(right: 20),
      width: 65,
      decoration: BoxDecoration(
          color: currentHour == forecastHour
              ? Colors.white
              : AppColors.primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 5,
              color: AppColors.primaryColor.withOpacity(.2),
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            forecastTime,
            style: const TextStyle(
              fontSize: 17,
              color: AppColors.greyColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          Image.asset(
            'assets/$forecastWeatherIcon',
            width: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                forecastTemperature,
                style: const TextStyle(
                  color: AppColors.greyColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                '°',
                style: TextStyle(
                  color: AppColors.greyColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  fontFeatures: [
                    FontFeature.enable('sups'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
