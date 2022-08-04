import 'package:flutter/material.dart';
import 'package:flutter_auth_app/presentation/presentation.dart';

class SpacerV extends StatelessWidget {
  const SpacerV({super.key, this.value});
  final double? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: value ?? Dimens.space8,
    );
  }
}
