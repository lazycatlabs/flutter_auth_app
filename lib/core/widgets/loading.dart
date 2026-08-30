import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';

class Loading extends StatelessWidget {
  const Loading({this.showMessage = true, this.color});

  final bool showMessage;
  final Color? color;

  @override
  Widget build(BuildContext context) => FittedBox(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: Dimens.space16,
      children: [
        CircularProgressIndicator(
          color: color,
          padding: EdgeInsets.all(Dimens.space16),
        ),
        Visibility(
          visible: showMessage,
          child: Text(
            Strings.of(context)!.pleaseWait,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: color),
          ),
        ),
      ],
    ),
  );
}
