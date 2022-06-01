import 'package:flutter/material.dart';

class MovieImage extends StatelessWidget {
  MovieImage(
    this.path, {
    this.resolution = 'w300',
    this.borderRadius = BorderRadius.zero,
  }) : super(key: ValueKey('$path/$resolution'));

  final String? path;
  final String resolution;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '[MovieImage]$path',
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Image.network(
          'https://image.tmdb.org/t/p/$resolution/$path',
          errorBuilder: (context, error, stackTrace) =>
              Image.asset('assets/no_image.png'),
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
