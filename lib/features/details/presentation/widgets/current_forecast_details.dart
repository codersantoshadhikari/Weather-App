import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/widgets/weather_item.dart';
import '../../../../core/utilize/colors.dart';
import '../../../../core/utilize/constants.dart';
import '../../../../generated/assets.dart';
import '../manager/details_notifier.dart';

class CurrentForecastDetails extends StatelessWidget {
  const CurrentForecastDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final detailsNotifier = context.read<DetailsNotifier>();
    final forecast = detailsNotifier.weatherModel.dailyWeatherForecast[0];
    return Stack(
      children: [
        Positioned(
          width: 150,
          child: Image.asset("assets/${forecast.weatherIcon}.png"),
        ),
        Positioned(
          top: 150,
          left: 30,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              forecast.weatherName,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Container(
            width: AppConstants.size.width * .8,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WeatherItem(
                  value: forecast.maxWindSpeed,
                  unit: "km/h",
                  imageUrl: Assets.assetsWindspeed,
                ),
                WeatherItem(
                  value: forecast.avgHumidity,
                  unit: "%",
                  imageUrl: Assets.assetsHumidity,
                ),
                WeatherItem(
                  value: forecast.chanceOfRain,
                  unit: "%",
                  imageUrl: Assets.assetsLightrain,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                forecast.maxTemperature.round().toString(),
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = AppColors.shader,
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
        )
      ],
    );
  }
}
