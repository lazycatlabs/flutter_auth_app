import 'package:flutter_auth_app/core/core.dart';
import 'package:material_ui/material_ui.dart';

class DropDown<T> extends StatefulWidget {
  const DropDown({
    required this.value,
    required this.items,
    required this.onChanged,
    super.key,
    this.hint,
    this.hintIsVisible = true,
    this.prefixIcon,
  });

  final T value;
  final List<DropdownMenuItem<T>> items;
  final bool hintIsVisible;
  final String? hint;
  final ValueChanged<T?>? onChanged;
  final Widget? prefixIcon;

  @override
  _DropDownState<T> createState() => _DropDownState();
}

class _DropDownState<T> extends State<DropDown<T>> {
  final _fnDropdown = FocusNode();

  @override
  void dispose() {
    _fnDropdown.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(vertical: Dimens.space8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.hintIsVisible && widget.hint != null) ...{
          Text(
            widget.hint ?? '',
            style: TextTheme.of(context).labelMedium?.copyWith(
              color: ColorScheme.of(context).onSurfaceVariant,
            ),
          ),
          const SpacerV(),
        },
        ListenableBuilder(
          listenable: _fnDropdown,
          builder: (_, _) => ButtonTheme(
            key: widget.key,
            alignedDropdown: true,
            padding: EdgeInsets.zero,
            textTheme: ButtonTextTheme.primary,
            child: DropdownButtonFormField<T>(
              isExpanded: true,
              focusNode: _fnDropdown,
              dropdownColor: ColorScheme.of(context).surface,
              icon: AnimatedSwitcher(
                duration: Motion.medium,
                transitionBuilder: (child, animation) => RotationTransition(
                  turns: Tween<double>(begin: 0.75, end: 1).animate(animation),
                  child: FadeTransition(opacity: animation, child: child),
                ),
                child: _fnDropdown.hasFocus
                    ? Icon(
                        Icons.check_rounded,
                        key: const ValueKey('check'),
                        color: ColorScheme.of(context).primary,
                      )
                    : Icon(
                        Icons.keyboard_arrow_down_rounded,
                        key: const ValueKey('arrow'),
                        color: ColorScheme.of(context).onSurfaceVariant,
                      ),
              ),
              style: TextTheme.of(context).bodyLarge,
              decoration: InputDecoration(
                isCollapsed: true,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(
                    left: Dimens.space16,
                    right: Dimens.space4,
                  ),
                  child: widget.prefixIcon,
                ),
                prefixIconConstraints: BoxConstraints(
                  minHeight: Dimens.space24,
                  maxHeight: Dimens.space24,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: Dimens.space16),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(Dimens.cornerRadius),
              ),
              initialValue: widget.value,
              items: widget.items,
              onChanged: (T? value) {
                _fnDropdown.requestFocus();
                widget.onChanged?.call(value);
              },
            ),
          ),
        ),
      ],
    ),
  );
}
