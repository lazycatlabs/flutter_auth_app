import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';

class ButtonNotification extends StatelessWidget {
  const ButtonNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SizedBox(
        width: Dimens.space36,
        height: Dimens.space36,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Icon(
                Icons.notifications_outlined,
                size: Dimens.space30,
              ),
            ),
            Positioned(
              right: Dimens.space4,
              bottom: Dimens.space6,
              child: Visibility(
                child: CircleAvatar(
                  backgroundColor: Palette.secondary,
                  maxRadius: Dimens.space8,
                  child: Center(
                    child: Text(
                      "1",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context)
                                .extension<LzyctColors>()!
                                .background,
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
      onPressed: () async {
        ///TODO: Go to notifications page
        // context.goTo(AppRoute.notifications);
      },
    );
  }
}
