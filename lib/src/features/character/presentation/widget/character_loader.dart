import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CharacterLoader extends StatelessWidget {
  const CharacterLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SizedBox.square(
        dimension: 180.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white, // Background color of shimmer
            ),
          ),
        ),
      ),
    );
  }
}
