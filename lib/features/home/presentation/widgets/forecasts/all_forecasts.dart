import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/models/hourly_forecast_model.dart';
import '../../manager/home_notifier.dart';
import 'hourly_forecast_card.dart';

class AllForecasts extends StatelessWidget {
  const AllForecasts({super.key});

  @override
  Widget build(BuildContext context) {
    final homeNotifier = context.watch<HomeNotifier>();
    return SizedBox(
      height: 110,
      child: ListView.builder(
        itemCount: homeNotifier.weatherModel.hourlyWeatherForecast.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          final HourlyForecastModel forecast =
              homeNotifier.weatherModel.hourlyWeatherForecast[index];
          return HourlyForecastCard(forecast: forecast);
        },
      ),
    );
  }
}
