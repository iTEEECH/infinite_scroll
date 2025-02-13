import 'package:flutter/material.dart';
import 'package:infinite_scroll/src/features/character/character.dart';

class CharacterList extends StatelessWidget {
  final ScrollController controller;
  final List<Character> characters;

  const CharacterList({
    super.key,
    required this.controller,
    required this.characters,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemCount: characters.length,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (_, int index) {
        final Character character = characters[index];
        return CharacterCard(
          key: ValueKey(index),
          name: character.name,
          imageUrl: character.imageUrl,
          films: character.films,
        );
      },
    );
  }
}
