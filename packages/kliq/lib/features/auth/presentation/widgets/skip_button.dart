import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kliq/config/route/paths.dart';
import 'package:kliq_components/kliq_componenets.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(Paths.homeScreenRoute.path);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.topRight,
          child: Text(
            'Skip',
            style: textTheme(context).bodySmall?.copyWith(
                fontSize: 20,
                color: colorScheme(context).surface.withOpacity(0.7)),
          ),
        ),
      ),
    );
  }
}
