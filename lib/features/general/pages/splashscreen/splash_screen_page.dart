import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

part 'splash_screen_failure.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) => Parent(
    child: BlocConsumer<GeneralTokenCubit, GeneralTokenState>(
      listenWhen: (_, current) => current is GeneralTokenStateSuccess,
      //coverage:ignore-start
      listener: (context, _) => context.goNamed(Routes.root.name),
      //coverage:ignore-end
      builder: (_, state) => ColoredBox(
        color: ColorScheme.of(context).surface,
        child: Center(
          child: switch (state) {
            GeneralTokenStateFailure(:final message) => _SplashScreenFailure(
              message: message,
            ),
            GeneralTokenStateLoading() ||
            GeneralTokenStateSuccess() => TweenAnimationBuilder<double>(
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
          },
        ),
      ),
    ),
  );
}
