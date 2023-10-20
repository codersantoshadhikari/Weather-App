import 'package:flutter/material.dart';

import '../../../../../core/utilize/colors.dart';
import '../../../../../core/utilize/constants.dart';
import 'current_details.dart';
import 'current_location.dart';
import 'theme_mode_button.dart';

class CurrentWeatherCard extends StatelessWidget {
  const CurrentWeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: AppConstants.size.height * .7,
      decoration: BoxDecoration(
        gradient: AppColors.linearGradientBlue,
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // dark mode icon
              ThemeModeButton(),
              CurrentLocation(),
            ],
          ),
          CurrentDetails(),
        ],
      ),
    );
  }
}
