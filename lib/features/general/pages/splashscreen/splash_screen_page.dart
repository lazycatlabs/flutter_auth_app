import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/general/general.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Parent(
      child: BlocListener<GeneralTokenCubit, GeneralTokenState>(
        //coverage:ignore-start
        listener: (context, state) => {
          if (state is GeneralTokenStateSuccess)
            {context.goNamed(Routes.root.name)}
        },
        child: ColoredBox(
          color: Theme.of(context).extension<LzyctColors>()!.background!,
          child: Center(
            child: Image.asset(
              Theme.of(context).brightness == Brightness.dark
                  ? Images.icLauncherDark
                  : Images.icLauncher,
              width: context.widthInPercent(55),
            ),
          ),
        ),
      ),
    );
  }
}
