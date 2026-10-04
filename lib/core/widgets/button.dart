import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:material_ui/material_ui.dart';

/// Primary filled button that gently scales down while pressed and
/// cross-fades between its enabled and disabled colours.
class Button extends StatefulWidget {
  final String title;
  final VoidCallback? onPressed;
  final double? width;
  final Color? color;
  final Color? titleColor;
  final double? fontSize;
  final Color? splashColor;

  const Button({
    required this.title,
    required this.onPressed,
    super.key,
    this.width,
    this.color,
    this.titleColor,
    this.fontSize,
    this.splashColor,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  final _isPressed = ValueNotifier(false);

  @override
  void dispose() {
    _isPressed.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEnabled = widget.onPressed != null;
    final background = widget.color ?? ColorScheme.of(context).primary;
    final foreground = widget.titleColor ?? ColorScheme.of(context).onPrimary;

    return ValueListenableBuilder<bool>(
      valueListenable: _isPressed,
      builder: (_, isPressed, child) => AnimatedScale(
        scale: isPressed ? 0.97 : 1,
        duration: Motion.fast,
        curve: Motion.standard,
        child: child,
      ),
      child: Listener(
        onPointerDown: (_) => _isPressed.value = isEnabled,
        onPointerUp: (_) => _isPressed.value = false,
        onPointerCancel: (_) => _isPressed.value = false,
        child: SizedBox(
          width: widget.width,
          child: AnimatedOpacity(
            opacity: isEnabled ? 1 : 0.4,
            duration: Motion.medium,
            curve: Motion.standard,
            child: TextButton(
              onPressed: widget.onPressed,
              style: TextButton.styleFrom(
                backgroundColor: background,
                foregroundColor: foreground,
                disabledBackgroundColor: background,
                disabledForegroundColor: foreground,
                overlayColor: widget.splashColor ?? foreground,
                minimumSize: Size(Dimens.space64, Dimens.space50),
                padding: EdgeInsets.symmetric(
                  horizontal: Dimens.space24,
                  vertical: Dimens.space12,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(Dimens.cornerRadius),
                  ),
                ),
              ),
              child: Text(
                widget.title,
                style: TextTheme.of(context).bodyMedium600?.copyWith(
                  color: foreground,
                  fontSize: widget.fontSize,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
