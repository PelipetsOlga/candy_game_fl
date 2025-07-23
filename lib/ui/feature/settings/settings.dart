import 'package:candy_game/di/di.dart';
import 'package:candy_game/domain/repository.dart';
import 'package:flutter/material.dart';


class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _ambientMusic = true;
  bool _soundFx = true;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final repository = getIt.get<GameRepository>();
    final ambientMusic = await repository.getAmbientMusic();
    final soundFx = await repository.getSoundFx();
    setState(() {
      _ambientMusic = ambientMusic;
      _soundFx = soundFx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                iconSize: 48,
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'SETTINGS',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(color: Colors.white),
                  overflow: TextOverflow.visible,
                  softWrap: true,
                  maxLines: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 36),
          _buildSwitchRow(
              'AMBIENT MUSIC',
              _ambientMusic,
              (value) async {
                await getIt.get<GameRepository>().setAmbientMusic(value);
                setState(() {
                  _ambientMusic = value;
                });
              }),
          _buildSwitchRow('SOUND FX', _soundFx,
              (value) async {
                await getIt.get<GameRepository>().setSoundFx(value);
                setState(() {
                  _soundFx = value;
                });
              }),
          ListTile(
            title: Text('PRIVACY POLICY',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Theme.of(context).colorScheme.secondary)),
            onTap: () {},
          ),
          ListTile(
            title: Text('SUPPORT',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Theme.of(context).colorScheme.secondary)),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchRow(
      String title, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Colors.white)),
      value: value,
      onChanged: onChanged,
      activeColor: Theme.of(context).highlightColor,
      inactiveThumbColor: Colors.grey,
      inactiveTrackColor: Colors.grey[700],
    );
  }
}
