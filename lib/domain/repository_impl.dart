import 'package:candy_game/domain/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameRepositoryImpl implements GameRepository {
  static const String _ambientMusicKey = 'ambient_music';
  static const String _soundFxKey = 'sound_fx';

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
}
