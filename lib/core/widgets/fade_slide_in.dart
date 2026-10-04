import 'package:flutter_auth_app/core/core.dart';
import 'package:material_ui/material_ui.dart';

/// Fades and lifts [child] into place once, after an optional [delay].
///
/// Pass an increasing [delay] to siblings for a staggered entrance.
class FadeSlideIn extends StatelessWidget {
  const FadeSlideIn({
    required this.child,
    super.key,
    this.delay = Duration.zero,
    this.duration = Motion.slow,
    this.offset = 24,
  });

  final Widget child;
  final Duration delay;
  final Duration duration;

  /// Vertical distance in logical pixels the child travels while fading in.
  final double offset;

  @override
  Widget build(BuildContext context) {
    final total = delay + duration;
    final start = total.inMicroseconds == 0
        ? 0.0
        : delay.inMicroseconds / total.inMicroseconds;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: total,
      curve: Interval(start, 1, curve: Motion.emphasized),
      builder: (_, value, child) => Opacity(
        opacity: value,
        child: Transform.translate(
          offset: Offset(0, offset * (1 - value)),
          child: child,
        ),
      ),
      child: child,
    );
  }
}
