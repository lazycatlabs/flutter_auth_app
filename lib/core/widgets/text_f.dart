import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/utils/utils.dart';

class TextF extends StatefulWidget {
  const TextF({
    required this.label,
    super.key,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.textInputType,
    this.inputFormatters,
    this.enabled = true,
    this.textInputAction,
    this.onTap,
    this.autoFillHints,
    this.description,
    this.labelTextStyle,
    this.noErrorSpace = false,
    this.focusNode,
    this.backgroundColor,
    this.hint,
    this.height,
    this.textStyle,
    this.maxLines = 1,
    this.semantic,
    this.onChange,
    this.onSaved,
    this.validator,
  });

  final TextEditingController? controller;
  final String label;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final bool enabled;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final List<String>? autoFillHints;
  final String? description;
  final TextStyle? labelTextStyle;
  final TextStyle? textStyle;
  final bool noErrorSpace;
  final FocusNode? focusNode;
  final Color? backgroundColor;
  final String? hint;
  final double? height;
  final int maxLines;
  final String? semantic;
  final Function(String?)? onChange;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;

  @override
  TextFState createState() => TextFState();
}

class TextFState extends State<TextF> {
  final _debouncer = Debouncer();

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: widget.onTap,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Dimens.space8,
      children: [
        Text(
          widget.label,
          style: widget.labelTextStyle ?? Theme.of(context).textTheme.bodySmall,
        ),
        _textFormField,
        if (widget.description != null)
          Text(
            widget.description!,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        SpacerV(value: Dimens.space4),
      ],
    ),
  );

  Widget get _textFormField => Semantics(
    label: widget.semantic,
    child: TextFormField(
      autofillHints: widget.autoFillHints,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
      enabled: widget.enabled,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.textInputType,
      controller: widget.controller,
      obscureText: widget.obscureText ?? false,
      focusNode: widget.focusNode,
      maxLines: widget.maxLines,
      onTap: widget.onTap,
      textAlignVertical: TextAlignVertical.center,
      style: widget.textStyle ?? Theme.of(context).textTheme.bodyMedium500,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: Theme.of(context).extension<LzyctColors>()!.surface,
        contentPadding: EdgeInsets.symmetric(
          horizontal: Dimens.space6,
          vertical: Dimens.space12,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimens.space16),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimens.space16),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: Dimens.space2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimens.space16),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimens.space16),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: Dimens.space2,
          ),
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon == null
            ? null
            : Padding(
                padding: EdgeInsets.only(
                  left: Dimens.space8,
                  right: Dimens.space8,
                ),
                child: Center(
                  widthFactor: 1,
                  heightFactor: 1,
                  child: widget.suffixIcon,
                ),
              ),
        suffixIconConstraints: const BoxConstraints(),
        hintText: widget.hint,
        floatingLabelBehavior: widget.hint != null
            ? FloatingLabelBehavior.always
            : null,
        hintStyle: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: Theme.of(context).hintColor),
      ),
      validator: widget.validator,
      onChanged: (String value) =>
          _debouncer.run(() => widget.onChange?.call(value)),
      onSaved: widget.onSaved,
    ),
  );
}
