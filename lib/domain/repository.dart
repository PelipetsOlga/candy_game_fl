abstract interface class GameRepository {
  Future<bool> getAmbientMusic();

  Future<void> setAmbientMusic(bool value);

  Future<bool> getSoundFx();

  Future<void> setSoundFx(bool value);

  Future<double> getScore();

  Future<void> setScore(double value);

  Future<void> appendScore(double value);

  Future<int> getBet();

  Future<void> setBet(int value);

  Future<List<String>> getBackgrounds();

  Future<void> setBackgrounds(List<String> backgrounds);

  Future<String> getCurrentBackground();

  Future<void> setCurrentBackground(String background);
}
