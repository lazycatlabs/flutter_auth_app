import 'package:flutter/material.dart';
import 'package:flutter_auth_app/presentation/presentation.dart';

///*********************************************
///  flutter_auth_app |
///  button_notification.dart
/// --------------------------------------------
/// Created by Mudassir 🧑🏻‍💻 @ lazycatlabs.com
/// on 📅 03/01/22 🕰 11:13 with ❤️
/// ✉️ : hey.mudassir@gmail.com
/// 🚀 : https://www.github.com/Lzyct
/// 🌐 : https://www.lazycatlabs.com
///*********************************************
/// © 2022 | All Right Reserved
class ButtonNotification extends StatelessWidget {
  const ButtonNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Icon(
              Icons.notifications_outlined,
              size: Dimens.space24,
            ),
          ),
          Positioned(
            right: Dimens.space4,
            bottom: Dimens.space6,
            child: Visibility(
              child: CircleAvatar(
                backgroundColor: Palette.red,
                maxRadius: Dimens.space8,
                child: Center(
                  child: Text(
                    "1",
                    style: Theme.of(context)
                        .textTheme
                        .overline
                        ?.copyWith(color: Palette.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      onPressed: () async {
        ///TODO: Go to notifications page
        // context.goTo(AppRoute.notifications);
      },
    );
  }
}
