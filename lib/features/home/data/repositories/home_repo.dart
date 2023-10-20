import '../../../../core/common/models/weather_model.dart';

abstract class HomeRepo {
  Future<WeatherModel> fetchData(String searchText);
}
