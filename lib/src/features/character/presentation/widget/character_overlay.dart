import 'package:flutter/material.dart';

class CharacterOverlay extends StatelessWidget {
  const CharacterOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: <Color>[
              Colors.black.withValues(alpha: 0.8),
              Colors.white.withValues(alpha: 0.2),
            ],
          ),
        ),
      ),
    );
  }
}
