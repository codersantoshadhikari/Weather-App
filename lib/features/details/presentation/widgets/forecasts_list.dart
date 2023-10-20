import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../manager/details_notifier.dart';
import 'forecast_card.dart';

class ForecastsList extends StatelessWidget {
  const ForecastsList({super.key});

  @override
  Widget build(BuildContext context) {
    final detailsNotifier = context.watch<DetailsNotifier>();
    final forecast = detailsNotifier.weatherModel.dailyWeatherForecast;
    return SizedBox(
      height: 300,
      child: ListView.separated(
        itemCount: min(3, forecast.length),
        itemBuilder: (context, index) => ForecastCard(
          forecastModel: forecast[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 5),
      ),
    );
  }
}
