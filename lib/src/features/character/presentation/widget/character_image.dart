import 'package:flutter/material.dart';

class CharacterImage extends StatelessWidget {
  final String path;
  final double dimension;
  final double borderWidth;
  final Color? borderColor;
  final Color? bgColor;
  final bool trBackground;
  final double radius;

  const CharacterImage(
    this.path, {
    super.key,
    this.dimension = 100,
    this.bgColor,
    this.borderWidth = 0,
    this.borderColor,
    this.trBackground = false,
    this.radius = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimension,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(radius),
          image: DecorationImage(image: Image.network(path).image, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
