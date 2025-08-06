import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';

class Loading extends StatelessWidget {
  const Loading({this.showMessage = true});

  final bool showMessage;

  @override
  Widget build(BuildContext context) => FittedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ColorLoader(),
          Visibility(
            visible: showMessage,
            child: Text(
              Strings.of(context)!.pleaseWait,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
}
