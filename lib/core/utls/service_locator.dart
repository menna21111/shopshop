import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/registratian/data/repo.dart';
import 'apiservice.dart';

final getit = GetIt.instance;
void setuplocater() {
  getit.registerSingleton<Apiservice>(Apiservice(Dio()));
  getit.registerSingleton<UserRepository>(
      UserRepository(getit.get<Apiservice>()));
}
