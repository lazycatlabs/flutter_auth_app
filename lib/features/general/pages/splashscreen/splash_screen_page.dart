import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/general/general.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

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
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.85, end: 1),
            duration: Motion.slow,
            curve: Motion.emphasized,
            builder: (_, scale, child) => Transform.scale(
              scale: scale,
              child: Opacity(
                opacity: ((scale - 0.85) / 0.15).clamp(0, 1),
                child: child,
              ),
            ),
            child: BrandLogo(width: context.widthInPercent(32)),
          ),
        ),
      ),
    ),
  );
}
