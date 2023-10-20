import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/common/models/daily_forecast_model.dart';
import '../../../../core/utilize/colors.dart';
import '../../../../generated/assets.dart';

class ForecastCard extends StatelessWidget {
  const ForecastCard({super.key, required this.forecastModel});

  final DailyForecastModel forecastModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  forecastModel.forecastDate,
                  style: const TextStyle(
                    color: Color(0xff6696f5),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          forecastModel.minTemperature.toString(),
                          style: const TextStyle(
                            color: AppColors.greyColor,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Text(
                          '°',
                          style: TextStyle(
                              color: AppColors.greyColor,
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              fontFeatures: [
                                FontFeature.enable('sups'),
                              ]),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          forecastModel.maxTemperature.toString(),
                          style: const TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Text(
                          '°',
                          style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              fontFeatures: [
                                FontFeature.enable('sups'),
                              ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/${forecastModel.weatherIcon}.png',
                      width: 30,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      forecastModel.weatherName,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${forecastModel.chanceOfRain}%",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      Assets.assetsLightrain,
                      width: 30,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
