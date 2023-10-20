import 'package:flutter/material.dart';

import '../../../../core/utilize/colors.dart';
import '../widgets/details_page_body.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: const Text('Forecasts'),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
      ),
      body: const DetailsPageBody(),
    );
  }
}
