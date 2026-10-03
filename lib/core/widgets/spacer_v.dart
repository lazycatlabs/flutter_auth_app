import 'package:flutter_auth_app/core/core.dart';
import 'package:material_ui/material_ui.dart';

class SpacerV extends StatelessWidget {
  const SpacerV({super.key, this.value});

  final double? value;

  @override
  Widget build(BuildContext context) =>
      SizedBox(height: value ?? Dimens.space8);
}
