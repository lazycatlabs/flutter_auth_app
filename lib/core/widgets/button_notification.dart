import 'package:flutter_auth_app/core/core.dart';
import 'package:material_ui/material_ui.dart';

class ButtonNotification extends StatelessWidget {
  const ButtonNotification({super.key});

  @override
  Widget build(BuildContext context) => IconButton(
    icon: SizedBox(
      width: Dimens.space36,
      height: Dimens.space36,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Icon(Icons.notifications_none_rounded, size: Dimens.space24),
          ),
          Positioned(
            right: Dimens.space6,
            top: Dimens.space6,
            child: Visibility(
              child: CircleAvatar(
                backgroundColor: ColorScheme.of(context).primary,
                maxRadius: Dimens.space6,
                child: Center(
                  child: Text(
                    '1',
                    style: TextTheme.of(context).labelSmall?.copyWith(
                      color: ColorScheme.of(context).onPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    onPressed: () {
      ///TODO: Go to notifications page
      // context.goTo(AppRoute.notifications);
    },
  );
}
