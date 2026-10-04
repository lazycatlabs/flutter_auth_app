import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:material_ui/material_ui.dart';

class ButtonText extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double? width;
  final Color? color;
  final Color? titleColor;
  final double? fontSize;
  final Color? splashColor;

  const ButtonText({
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
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(vertical: Dimens.space8),
    child: TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: titleColor ?? ColorScheme.of(context).primary,
        backgroundColor: color,
        overlayColor: splashColor,
        padding: EdgeInsets.symmetric(
          horizontal: Dimens.space16,
          vertical: Dimens.space12,
        ),
      ),
      child: Text(
        title,
        style: TextTheme.of(context).bodyMedium600?.copyWith(
          color: titleColor ?? ColorScheme.of(context).primary,
          fontSize: fontSize,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
