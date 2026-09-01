import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';

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
          Text(widget.hint ?? '', style: TextTheme.of(context).bodySmall),
          SpacerV(value: Dimens.space6),
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
              icon: _fnDropdown.hasFocus
                  ? Icon(Icons.check, color: ColorScheme.of(context).primary)
                  : const Icon(Icons.keyboard_arrow_down),
              style: TextTheme.of(context).bodyMedium?.copyWith(
                color: ColorScheme.of(context).onSurfaceVariant,
              ),
              decoration: InputDecoration(
                alignLabelWithHint: true,
                isDense: true,
                isCollapsed: true,
                filled: true,
                labelStyle: TextTheme.of(context).bodyMedium?.copyWith(
                  color: ColorScheme.of(context).onSurfaceVariant,
                ),
                fillColor: ColorScheme.of(context).surfaceContainer,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: Dimens.space12),
                  child: widget.prefixIcon,
                ),
                prefixIconConstraints: BoxConstraints(
                  minHeight: Dimens.space24,
                  maxHeight: Dimens.space24,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: Dimens.space12),
                enabledBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(Dimens.space16),
                  borderSide: BorderSide(
                    color: ColorScheme.of(context).surfaceContainer,
                  ),
                ),
                border: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(Dimens.space16),
                  borderSide: BorderSide(
                    color: ColorScheme.of(context).surfaceContainer,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(Dimens.space16),
                  borderSide: BorderSide(
                    color: ColorScheme.of(context).surfaceContainer,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(Dimens.space16),
                  borderSide: BorderSide(
                    color: ColorScheme.of(context).error,
                    width: Dimens.space2,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(Dimens.space16),
                  borderSide: BorderSide(
                    color: ColorScheme.of(context).error,
                    width: Dimens.space2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(Dimens.space16),
                  borderSide: BorderSide(
                    color: ColorScheme.of(context).primary,
                    width: Dimens.space2,
                  ),
                ),
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
