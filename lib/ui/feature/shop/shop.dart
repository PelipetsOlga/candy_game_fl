import 'package:candy_game/core/di/dependency_injection.dart';
import 'package:candy_game/domain/game_controller.dart';
import 'package:candy_game/domain/models/backgrounds.dart';
import 'package:candy_game/domain/repository.dart';
import 'package:candy_game/ui/main/constants.dart';
import 'package:flutter/material.dart';

class ShopDialog extends StatefulWidget {
  @override
  _ShopDialogState createState() => _ShopDialogState();
}

class _ShopDialogState extends State<ShopDialog> {
  double _currentScore = initialScore;
  String _currentBackground = defaultBackgrounds.first.assetTitle;
  List<String> _myBackgrounds = [defaultBackgrounds.first.assetTitle];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final repository = getIt.get<GameRepository>();
    final score = await repository.getScore();
    final background = await repository.getCurrentBackground();
    final myBackgrounds = await repository.getBackgrounds();
    
    setState(() {
      _currentScore = score;
      _currentBackground = background;
      _myBackgrounds = myBackgrounds;
    });
  }

  @override
  Widget build(BuildContext context) {
    var pieces = getIt.get<GameController>().backgrounds;
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black87.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'SHOP',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                            color: const Color(0xFF80DEEA), // Light blue color
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Color(0xFF80DEEA), // Light blue color
                      size: 32,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Credits: ${_currentScore.toStringAsFixed(0)}',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ..._buildColumnItems(pieces, context),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildColumnItems(List<Background> backgrounds, BuildContext context) {
    List<Widget> items = [];
    for (int i = 0; i < backgrounds.length; i++) {
      items.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: _buildItem(backgrounds[i], context),
        ),
      );
    }
    return items;
  }

  Widget _buildItem(Background background, BuildContext context) {
    final isCurrentBackground = background.assetTitle == _currentBackground;
    final isOwned = _myBackgrounds.contains(background.assetTitle);
    final canAfford = background.price <= _currentScore;
    
    String buttonText;
    bool isEnabled;
    Color buttonColor;
    
    if (isCurrentBackground) {
      // 1) Current background - disabled with "Selected"
      buttonText = "Selected";
      isEnabled = false;
      buttonColor = Colors.black87;
    } else if (isOwned) {
      // 2) Owned but not current - enabled with "Select"
      buttonText = "Select";
      isEnabled = true;
      buttonColor = Theme.of(context).colorScheme.primary;
    } else if (canAfford) {
      // 3) Can afford to buy - enabled with "Buy: price"
      buttonText = "Buy: ${background.price}";
      isEnabled = true;
      buttonColor = Theme.of(context).colorScheme.secondary;
    } else {
      // 4) Cannot afford - disabled with "Buy: price"
      buttonText = "Buy: ${background.price}";
      isEnabled = false;
      buttonColor = Theme.of(context).colorScheme.primary.withOpacity(0.7);
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 150,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              background.assetTitle,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            background.title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            'Price: ${background.price} credits',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withOpacity(0.7),
                ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: isEnabled ? () => _handleButtonPress(background) : (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                buttonText,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleButtonPress(Background background) async {
    final repository = getIt.get<GameRepository>();
    
    if (_myBackgrounds.contains(background.assetTitle)) {
      // Select owned background
      await repository.setCurrentBackground(background.assetTitle);
      Navigator.pop(context);
    } else {
      // Buy background
      if (background.price <= _currentScore) {
        await repository.appendScore(-background.price);
        await repository.setCurrentBackground(background.assetTitle);
        
        // Add to owned backgrounds
        List<String> updatedBackgrounds = List.from(_myBackgrounds);
        updatedBackgrounds.add(background.assetTitle);
        await repository.setBackgrounds(updatedBackgrounds);
        
        Navigator.pop(context);
      }
    }
  }
}
