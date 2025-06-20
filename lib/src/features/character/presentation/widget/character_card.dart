import 'package:flutter/material.dart';
import 'package:infinite_scroll/src/features/character/character.dart';

class CharacterCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final List<String> films;

  const CharacterCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.films,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 180.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Stack(
            children: <Widget>[
              CharacterImage(
                imageUrl,
                radius: 20.0,
                dimension: double.infinity,
              ),
              const CharacterOverlay(),
              Positioned(
                bottom: 12.0,
                left: 12.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      films.isNotEmpty ? films.first : '',
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
