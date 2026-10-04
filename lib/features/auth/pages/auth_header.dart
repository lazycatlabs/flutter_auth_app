import 'package:flutter_auth_app/core/core.dart';
import 'package:material_ui/material_ui.dart';

/// Logo, title and subtitle shown on top of the login and register forms.
class AuthHeader extends StatelessWidget {
  const AuthHeader({required this.title, required this.subtitle, super.key});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const FadeSlideIn(child: BrandLogo()),
      SpacerV(value: Dimens.space30),
      FadeSlideIn(
        delay: Motion.stagger,
        child: Text(title, style: TextTheme.of(context).headlineLarge),
      ),
      const SpacerV(),
      FadeSlideIn(
        delay: Motion.stagger * 2,
        child: Text(
          subtitle,
          style: TextTheme.of(context).bodyLarge?.copyWith(
            color: ColorScheme.of(context).onSurfaceVariant,
          ),
        ),
      ),
    ],
  );
}
