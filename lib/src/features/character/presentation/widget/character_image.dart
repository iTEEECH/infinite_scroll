import 'package:flutter/material.dart';

class CharacterImage extends StatelessWidget {
  final String path;
  final double width;
  final double height;
  final double borderWidth;
  final Color? borderColor;
  final Color? bgColor;
  final bool trBackground;
  final double radius;

  const CharacterImage(
    this.path, {
    super.key,
    this.width = 100,
    this.height = 100,
    this.bgColor,
    this.borderWidth = 0,
    this.borderColor,
    this.trBackground = false,
    this.radius = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(radius),
          image: DecorationImage(
            image: Image.network(
              path,
              errorBuilder: (_, __, ___) {
                return Center(
                  child: Text('No available.'),
                );
              },
            ).image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
