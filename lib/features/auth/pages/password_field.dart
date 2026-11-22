import 'package:flutter_auth_app/core/core.dart';
import 'package:material_ui/material_ui.dart';

/// Obscured [TextF] with an animated show/hide toggle, shared by the login
/// and register forms.
class PasswordField extends StatefulWidget {
  const PasswordField({
    required this.fieldKey,
    required this.label,
    required this.controller,
    required this.focusNode,
    required this.validator,
    super.key,
    this.textInputAction = TextInputAction.done,
    this.autoFillHints,
    this.semantic,
  });

  /// Key of the inner [TextF], used by widget tests and Maestro flows.
  final Key fieldKey;
  final String label;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? Function(String?) validator;
  final TextInputAction textInputAction;
  final List<String>? autoFillHints;
  final String? semantic;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  final _isVisible = ValueNotifier(false);

  @override
  void dispose() {
    _isVisible.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<bool>(
    valueListenable: _isVisible,
    builder: (_, isVisible, _) => TextF(
      key: widget.fieldKey,
      autoFillHints: widget.autoFillHints,
      focusNode: widget.focusNode,
      textInputAction: widget.textInputAction,
      controller: widget.controller,
      textInputType: TextInputType.text,
      prefixIcon: const Icon(Icons.lock_outline_rounded),
      obscureText: !isVisible,
      hint: Strings.of(context)!.passwordHint,
      label: widget.label,
      suffixIcon: IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        onPressed: () => _isVisible.value = !isVisible,
        icon: AnimatedSwitcher(
          duration: Motion.fast,
          transitionBuilder: (child, animation) =>
              ScaleTransition(scale: animation, child: child),
          child: Icon(
            isVisible
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            key: ValueKey(isVisible),
          ),
        ),
      ),
      validator: widget.validator,
      semantic: widget.semantic,
    ),
  );
}
