import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utilize/colors.dart';
import '../../../../../core/utilize/constants.dart';
import '../../manager/home_notifier.dart';

class CurrentLocation extends StatelessWidget {
  const CurrentLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final homeNotifier = context.watch<HomeNotifier>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/pin.png",
          width: 20,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          homeNotifier.weatherModel.location,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        IconButton(
          onPressed: () {
            homeNotifier.cityController.clear();
            showMaterialModalBottomSheet(
              context: context,
              builder: (context) => SingleChildScrollView(
                controller: ModalScrollController.of(context),
                child: Container(
                  height: AppConstants.size.height * .5,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        width: 70,
                        child: Divider(
                          thickness: 3.5,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onChanged: (searchText) {
                          homeNotifier.fetchWeatherData();
                        },
                        controller: homeNotifier.cityController,
                        autofocus: true,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
                            color: AppColors.primaryColor,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () => homeNotifier.cityController.clear(),
                            child: const Icon(
                              Icons.close,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          hintText: 'Search city e.g. Cairo',
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: AppColors.primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
