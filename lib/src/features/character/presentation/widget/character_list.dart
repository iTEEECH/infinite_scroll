import 'package:flutter/material.dart';
import 'package:infinite_scroll/src/features/character/character.dart';
import 'package:shimmer/shimmer.dart';

class CharacterList extends StatelessWidget {
  final List<Character> characters;

  final ScrollController controller;

  final bool isLoading;

  const CharacterList({super.key, required this.controller, required this.characters, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemCount: characters.length + (isLoading ? 5 : 0),
      physics: const ClampingScrollPhysics(),
      prototypeItem: SizedBox.square(dimension: 180.0),
      itemBuilder: (_, int index) {
        if (index < characters.length) {
          final Character character = characters[index];
          return CharacterCard(
            key: ValueKey(index),
            name: character.name,
            imageUrl: character.imageUrl,
            films: character.films,
          );
        }
        return const CharacterLoader();
      },
    );
  }
}
