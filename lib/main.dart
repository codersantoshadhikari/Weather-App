import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'core/utilize/constants.dart';
import 'core/utilize/service_locator.dart';
import 'features/details/presentation/manager/details_notifier.dart';
import 'features/home/presentation/manager/home_notifier.dart';
import 'features/home/presentation/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _init(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeNotifier>(
          create: (_) => HomeNotifier(),
        ),
        ChangeNotifierProvider<DetailsNotifier>(
          create: (_) => DetailsNotifier(),
        ),
        ChangeNotifierProxyProvider(
          create: (_) => DetailsNotifier(),
          update: (_, HomeNotifier homeNotifier, detailsNotifier) =>
              detailsNotifier!..weatherModel = homeNotifier.weatherModel,
        ),
        ProxyProvider<HomeNotifier, DetailsNotifier>(
          update: (_, homeNotifier, detailsNotifier) =>
              detailsNotifier!..weatherModel = homeNotifier.weatherModel,
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'weather',
        home: HomePage(),
      ),
    );
  }
}

_init(BuildContext context) async {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: SystemUiOverlay.values);

  AppConstants.size = MediaQuery.of(context).size;
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
