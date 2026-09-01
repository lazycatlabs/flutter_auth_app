import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/general/general.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) => Parent(
    child: BlocListener<GeneralTokenCubit, GeneralTokenState>(
      //coverage:ignore-start
      listener: (context, state) {
        switch (state) {
          case GeneralTokenStateSuccess():
            context.goNamed(Routes.root.name);
          case GeneralTokenStateLoading() || GeneralTokenStateFailure():
            break;
        }
      },
      //coverage:ignore-end
      child: ColoredBox(
        color: ColorScheme.of(context).surface,
        child: Center(
          child: Image.asset(
            Theme.brightnessOf(context) == Brightness.dark
                ? Images.icLauncherDark
                : Images.icLauncher,
            width: context.widthInPercent(55),
          ),
        ),
      ),
    ),
  );
}
