import 'package:flutter/material.dart';

import '../../../../../core/utilize/colors.dart';
import '../../../../../core/utilize/constants.dart';
import '../../../../details/presentation/pages/detail_page.dart';
import 'all_forecasts.dart';

class Forecasts extends StatelessWidget {
  const Forecasts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      height: AppConstants.size.height * .20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Today',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const DetailPage(),
                    ),
                  );
                }, //this will open forecast screen
                child: const Text(
                  'Forecasts',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const AllForecasts(),
        ],
      ),
    );
  }
}
