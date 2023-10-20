import 'package:flutter/material.dart';

import '../../../../core/utilize/constants.dart';
import 'current_forecast_details.dart';
import 'forecasts_list.dart';

class DetailsPageBody extends StatelessWidget {
  const DetailsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0.0,
          child: Container(
            height: AppConstants.size.height * .75,
            width: AppConstants.size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
          ),
        ),
        Positioned(
          right: 20,
          left: 20,
          bottom: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 300,
                width: AppConstants.size.width * .7,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.center,
                      colors: [
                        Color(0xffa9c1f5),
                        Color(0xff6696f5),
                      ]),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(.1),
                      offset: const Offset(0, 25),
                      blurRadius: 3,
                      spreadRadius: -10,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const CurrentForecastDetails(),
              ),
              const SizedBox(height: 20),
              const ForecastsList(),
            ],
          ),
        ),
      ],
    );
  }
}
