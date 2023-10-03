import 'package:moviedemo/main/main_develop.dart';
import 'package:moviedemo/repository/auth_repository.dart';
import 'package:moviedemo/repository/home_repository.dart';
import 'package:moviedemo/repository/network_repository.dart';
import 'package:moviedemo/repository/secure_store_repository.dart';
import 'package:moviedemo/ui/home/bloc/home_bloc.dart';
import 'package:moviedemo/ui/login/bloc/login_bloc.dart';
import 'package:moviedemo/ui/register/bloc/register_bloc.dart';
import 'package:moviedemo/ui/root/bloc/root_bloc.dart';
import 'package:moviedemo/ui/search/bloc/search_bloc.dart';
import 'package:moviedemo/ui/settings/bloc/settings_bloc.dart';
import 'package:moviedemo/ui/trending/bloc/trending_bloc.dart';
import 'package:moviedemo/utils/connectivity_manager.dart';
import 'package:moviedemo/utils/const.dart';

Future<void> setupDependency({String baseUrl = Const.baseUrlDevelop}) async {
  var networkFactory = NetworkRepositoryImpl(baseUrl: baseUrl);

  getIt.registerSingleton<NetworkRepository>(networkFactory);
  getIt.registerSingleton<SecureStoreRepository>(SecureStoreRepositoryImpl());
  getIt.registerSingleton<ConnectivityHelper>(ConnectivityHelper());
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

  getIt.registerFactory<RegisterBloc>(() => RegisterBloc(getIt()));
  getIt.registerFactory<LoginBloc>(() => LoginBloc(getIt()));

  getIt.registerFactory<RootBloc>(() => RootBloc());

  getIt.registerFactory<HomeRepository>(
      () => HomeRepositoryImpl(networkRepository: getIt()));
  getIt.registerFactory<HomeBloc>(() => HomeBloc(homeRepository: getIt()));

  getIt.registerFactory<TrendingBloc>(() => TrendingBloc());
  getIt.registerFactory<SearchBloc>(() => SearchBloc());
  getIt.registerFactory<SettingsBloc>(() => SettingsBloc());
}
