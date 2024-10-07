import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/general/general.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

///*********************************************
/// Created by ukietux on 24/08/20 with ♥
/// (>’_’)> email : hey.mudassir@gmail.com
/// github : https://www.github.com/Lzyct <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Parent(
      child: BlocListener<GeneralTokenCubit, GeneralTokenState>(
        listener: (context, state) =>
            state.whenOrNull(success: (_) => context.goNamed(Routes.root.name)),
        child: ColoredBox(
          color: Theme.of(context).extension<LzyctColors>()!.background!,
          child: Center(
            child: CircleAvatar(
              backgroundColor: Theme.of(context).hintColor,
              radius: Dimens.menu + Dimens.space6,
              child: CircleAvatar(
                backgroundImage: AssetImage(Images.icLauncher),
                radius: Dimens.menu,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
