import 'package:candy_game/domain/repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/repository.dart';

GetIt getIt = GetIt.instance;

Future<bool> initDI() async {
  // Initialize SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  
  // Register GameRepository with SharedPreferences
  getIt.registerLazySingleton<GameRepository>(() => GameRepositoryImpl(sharedPreferences));
  return true;
}