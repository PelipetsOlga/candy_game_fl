abstract interface class GameRepository {
  Future<bool> getAmbientMusic();

  Future<void> setAmbientMusic(bool value);

  Future<bool> getSoundFx();

  Future<void> setSoundFx(bool value);

  Future<double> getCount();

  Future<void> setCount(double value);

  Future<int> getBet();

  Future<void> setBet(int value);
}
