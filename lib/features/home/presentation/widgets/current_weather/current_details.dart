import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/widgets/weather_item.dart';
import '../../../../../core/utilize/colors.dart';
import '../../../../../generated/assets.dart';
import '../../manager/home_notifier.dart';

class CurrentDetails extends StatelessWidget {
  const CurrentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final homeNotifier = context.watch<HomeNotifier>();
    return Column(
      children: [
        SizedBox(
          height: 160,
          child: Image.asset(
              "assets/${homeNotifier.weatherModel.currentWeather.weatherIcon}.png"),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                homeNotifier.weatherModel.currentWeather.tempC
                    .round()
                    .toString(),
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = AppColors.shader,
                ),
              ),
            ),
            Text(
              'o',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                foreground: Paint()..shader = AppColors.shader,
              ),
            ),
          ],
        ),
        Text(
          homeNotifier.weatherModel.currentWeather.weatherName,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 20.0,
          ),
        ),
        Text(
          homeNotifier.weatherModel.currentWeather.lastUpdated,
          style: const TextStyle(
            color: Colors.white70,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Divider(
            color: Colors.white70,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WeatherItem(
                value: homeNotifier.weatherModel.currentWeather.windSpeed,
                unit: 'km/h',
                imageUrl: Assets.assetsWindspeed,
              ),
              WeatherItem(
                value: homeNotifier.weatherModel.currentWeather.humidity,
                unit: '%',
                imageUrl: Assets.assetsHumidity,
              ),
              WeatherItem(
                value: homeNotifier.weatherModel.currentWeather.cloud,
                unit: '%',
                imageUrl: Assets.assetsCloud,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
