import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/utils/utils.dart';

class Button extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final double? width;
  final Color? color;
  final Color? titleColor;
  final double? fontSize;
  final Color? splashColor;

  const Button({
    required this.title,
    required this.onPressed,
    super.key,
    this.width,
    this.color,
    this.titleColor,
    this.fontSize,
    this.splashColor,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
    width: width,
    child: TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: color ?? Theme.of(context).colorScheme.primary,
        foregroundColor: titleColor ?? Theme.of(context).colorScheme.onPrimary,
        disabledBackgroundColor: Theme.of(
          context,
        ).colorScheme.primary.withValues(alpha: 0.5),
        padding: EdgeInsets.symmetric(
          horizontal: Dimens.space24,
          vertical: Dimens.space12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(Dimens.cornerRadius)),
        ),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium500?.copyWith(
          color: titleColor ?? Theme.of(context).colorScheme.onPrimary,
          fontSize: fontSize,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
