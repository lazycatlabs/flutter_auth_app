import 'package:flutter_auth_app/core/core.dart';
import 'package:material_ui/material_ui.dart';

class SpacerH extends StatelessWidget {
  const SpacerH({super.key, this.value});

  final double? value;

  @override
  Widget build(BuildContext context) => SizedBox(width: value ?? Dimens.space8);
}
