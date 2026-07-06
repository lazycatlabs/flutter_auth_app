import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';

class LzyctCard extends StatelessWidget {
  const LzyctCard({required this.child, super.key, this.onTap});

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecorations(context).card,
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(Dimens.cornerRadius),
        child: child,
      ),
    ),
  );
}
