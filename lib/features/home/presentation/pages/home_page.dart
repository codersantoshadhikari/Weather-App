import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../manager/home_notifier.dart';
import '../widgets/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<HomeNotifier>().fetchWeatherData();
    return const Scaffold(
      backgroundColor: Colors.white,
      body: HomePageBody(),
    );
  }
}
