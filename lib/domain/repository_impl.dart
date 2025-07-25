import 'package:candy_game/domain/repository.dart';
import 'package:candy_game/ui/main/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameRepositoryImpl implements GameRepository {
  static const String _ambientMusicKey = 'ambient_music';
  static const String _soundFxKey = 'sound_fx';
  static const String _doubleCountKey = 'double_count';
  static const String _betKey = 'bet';
  static const String _backgroundsKey = 'backgrounds';
  static const String _currentBackgroundKey = 'current_background';

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
  Future<double> getScore() async {
    return _prefs.getDouble(_doubleCountKey) ?? initialScore;
  }

  @override
  Future<void> setScore(double value) async {
    await _prefs.setDouble(_doubleCountKey, value);
  }

  @override
  Future<void> appendScore(double value) async {
    final currentScore = await getScore();
    await setScore(currentScore + value);
  }

  @override
  Future<int> getBet() async {
    return _prefs.getInt(_betKey) ?? initialBet;
  }

  @override
  Future<void> setBet(int value) async {
    await _prefs.setInt(_betKey, value);
  }

  @override
  Future<List<String>> getBackgrounds() async {
    return _prefs.getStringList(_backgroundsKey) ??
        [defaultBackgrounds.first.assetTitle];
  }

  @override
  Future<void> setBackgrounds(List<String> backgrounds) async {
    await _prefs.setStringList(_backgroundsKey, backgrounds);
  }

  @override
  Future<String> getCurrentBackground() async {
    return _prefs.getString(_currentBackgroundKey) ??
        defaultBackgrounds.first.assetTitle;
  }

  @override
  Future<void> setCurrentBackground(String background) async {
    await _prefs.setString(_currentBackgroundKey, background);
  }
}
