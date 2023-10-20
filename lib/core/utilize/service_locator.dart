import 'package:get_it/get_it.dart';

import '../../features/home/data/repositories/home_repo_impl.dart';
import '../services/api_services.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(
    ApiServices(),
  );

  getIt.registerFactory<HomeRepoImpl>(
    () => HomeRepoImpl(apiServices: getIt<ApiServices>()),
  );
}
