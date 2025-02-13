import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CharacterLoader extends StatelessWidget {
  const CharacterLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        itemCount: 5,
        prototypeItem: const SizedBox(width: 180.0, height: 180.0),
        itemBuilder: (_, _) {
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
            title: SizedBox(
              width: 180.0,
              height: 180.0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
