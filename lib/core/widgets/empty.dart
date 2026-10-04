import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:material_ui/material_ui.dart';

class Empty extends StatelessWidget {
  final String? errorMessage;

  const Empty({super.key, this.errorMessage});

  @override
  Widget build(BuildContext context) => FadeSlideIn(
    child: Padding(
      padding: EdgeInsets.all(Dimens.space24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: Dimens.space16,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: ColorScheme.of(context).primaryContainer,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsets.all(Dimens.space24),
              child: Icon(
                Icons.inbox_outlined,
                size: Dimens.space36,
                color: ColorScheme.of(context).onPrimaryContainer,
              ),
            ),
          ),
          Text(
            errorMessage?.isNotEmpty ?? false
                ? errorMessage!
                : Strings.of(context)!.errorNoData,
            style: TextTheme.of(context).bodyMedium500?.copyWith(
              color: ColorScheme.of(context).onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
