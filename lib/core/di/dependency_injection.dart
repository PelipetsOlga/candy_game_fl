import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/repository.dart';
import '../../domain/repository_impl.dart';

final GetIt getIt = GetIt.instance;

void initDI() async {
  // Initialize SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  
  // Register GameRepository
  getIt.registerSingleton<GameRepository>(
    GameRepositoryImpl(getIt.get<SharedPreferences>()),
  );
} 