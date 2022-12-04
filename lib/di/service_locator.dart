import '../utils/exported_packages.dart';

final getIt = GetIt.instance;

Future<void> setupSingleton() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(dio: getIt<Dio>()));
  getIt.registerSingleton(API(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(UserRepository(userApi: getIt.get<API>()));
  getIt.registerSingleton(UserController());
}
