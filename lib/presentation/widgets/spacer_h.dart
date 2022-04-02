import 'package:flutter/material.dart';
import 'package:flutter_auth_app/presentation/presentation.dart';

class SpacerH extends StatelessWidget {
  const SpacerH({Key? key, this.value}) : super(key: key);
  final double? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: value ?? Dimens.space8,
    );
  }
}
