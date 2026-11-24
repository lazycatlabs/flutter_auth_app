part of 'splash_screen_page.dart';

class _SplashScreenFailure extends StatelessWidget {
  const _SplashScreenFailure({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Empty(errorMessage: message),
      Button(
        key: const Key('btn_retry'),
        title: Strings.of(context)!.retry,
        onPressed: () => context.read<GeneralTokenCubit>().generalToken(
          GeneralTokenParams.fromEnvironment,
        ),
      ),
    ],
  );
}
