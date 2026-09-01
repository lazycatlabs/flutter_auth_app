import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';

class Toast extends StatelessWidget {
  final IconData? icon;
  final Color? bgColor;
  final Color? textColor;
  final String? message;

  const Toast({
    super.key,
    this.icon,
    this.bgColor,
    this.message,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      DecoratedBox(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(Dimens.cornerRadius),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Dimens.space8,
            horizontal: Dimens.space16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: textColor),
              SpacerH(value: Dimens.space4),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: Dimens.menuContainer),
                child: Text(
                  message ?? '',
                  style: TextTheme.of(
                    context,
                  ).bodyMedium?.copyWith(color: textColor),
                  textAlign: TextAlign.start,
                  maxLines: 5,
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
