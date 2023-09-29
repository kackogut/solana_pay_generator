import 'package:flutter/material.dart';

import '../../data/shapes.dart';
import '../sizes.dart';
import '../theme/app_gradients.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Shape.cornersMedium),
      ),
      height: Sizes.actionButtonSize,
      child: Ink(
        decoration: BoxDecoration(
          gradient: AppGradients.solanaGradient,
          borderRadius: BorderRadius.circular(Shape.cornersMedium),
        ),
        child: Container(
          height: Sizes.actionButtonSize,
          alignment: Alignment.center,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
