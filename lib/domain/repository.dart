abstract interface class GameRepository {
  Future<bool> getAmbientMusic();

  Future<void> setAmbientMusic(bool value);

  Future<bool> getSoundFx();

  Future<void> setSoundFx(bool value);
}
