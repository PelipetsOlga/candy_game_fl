import 'package:candy_game/domain/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameRepositoryImpl implements GameRepository {
  static const String _ambientMusicKey = 'ambient_music';
  static const String _soundFxKey = 'sound_fx';
  static const String _doubleCountKey = 'double_count';
  static const String _betKey = 'bet';

  final SharedPreferences _prefs;

  GameRepositoryImpl(this._prefs);

  @override
  Future<bool> getAmbientMusic() async {
    return _prefs.getBool(_ambientMusicKey) ?? true;
  }

  @override
  Future<void> setAmbientMusic(bool value) async {
    await _prefs.setBool(_ambientMusicKey, value);
  }

  @override
  Future<bool> getSoundFx() async {
    return _prefs.getBool(_soundFxKey) ?? true;
  }

  @override
  Future<void> setSoundFx(bool value) async {
    await _prefs.setBool(_soundFxKey, value);
  }

  @override
  Future<double> getCount() async {
    return _prefs.getDouble(_doubleCountKey) ?? 0.0;
  }

  @override
  Future<void> setCount(double value) async {
    await _prefs.setDouble(_doubleCountKey, value);
  }

  @override
  Future<int> getBet() async {
    return _prefs.getInt(_betKey) ?? 10;
  }

  @override
  Future<void> setBet(int value) async {
    await _prefs.setInt(_betKey, value);
  }
}
