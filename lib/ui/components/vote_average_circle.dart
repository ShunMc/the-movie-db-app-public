import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:the_movie_db_app/hook/use_theme.dart';

class VoteAverageCircle extends HookWidget {
  const VoteAverageCircle({
    Key? key,
    required this.averagePercent,
    this.size = 36,
  }) : super(key: key);

  final int averagePercent;
  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = useTheme();
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: RichText(
                text: TextSpan(
                  style: theme.textTheme.bodyText2,
                  children: [
                    TextSpan(
                      text: averagePercent.toString(),
                      style: theme.textTheme.bodySmall!.copyWith(
                        color: Colors.white,
                        fontSize: size / 3,
                      ),
                    ),
                    TextSpan(
                      text: '%',
                      style: theme.textTheme.bodySmall!.copyWith(
                        color: Colors.white,
                        fontSize: size / 6,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: size / 1.2,
              height: size / 1.2,
              child: CircularProgressIndicator(
                color: averagePercent >= 70 ? Colors.green : Colors.yellow,
                backgroundColor: Colors.grey,
                strokeWidth: size / 15,
                value: averagePercent / 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
