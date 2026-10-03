import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:material_ui/material_ui.dart';

class Empty extends StatelessWidget {
  final String? errorMessage;

  const Empty({super.key, this.errorMessage});

  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(Images.icLauncher, width: context.widthInPercent(45)),
      Text(errorMessage ?? Strings.of(context)!.errorNoData),
    ],
  );
}
