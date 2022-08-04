import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth_app/presentation/presentation.dart';

///*********************************************
/// Created by ukieTux on 22/04/2020 with ♥
/// (>’_’)> email : hey.mudassir@gmail.com
/// github : https://www.github.com/Lzyct <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class TextF extends StatefulWidget {
  const TextF({
    super.key,
    this.curFocusNode,
    this.nextFocusNode,
    this.hint,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.textInputAction,
    this.obscureText,
    this.suffixIcon,
    this.controller,
    this.onTap,
    this.textAlign,
    this.enable,
    this.inputFormatter,
    this.minLine,
    this.maxLine,
    required this.prefixIcon,
    this.isHintVisible = true,
    this.prefixText,
    this.hintText,
    this.autofillHints,
  });

  final FocusNode? curFocusNode;
  final FocusNode? nextFocusNode;
  final String? hint;
  final Function(String)? validator;
  final Function(String)? onChanged;
  final Function? onTap;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final bool? obscureText;
  final int? minLine;
  final int? maxLine;
  final Widget? suffixIcon;
  final TextAlign? textAlign;
  final bool? enable;
  final List<TextInputFormatter>? inputFormatter;
  final bool isHintVisible;
  final Widget prefixIcon;
  final String? prefixText;
  final String? hintText;
  final Iterable<String>? autofillHints;

  @override
  _TextFState createState() => _TextFState();
}

class _TextFState extends State<TextF> {
  bool isFocus = false;
  String currentVal = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: Dimens.space8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: widget.isHintVisible,
            child: Text(
              widget.hint ?? "",
              style: Theme.of(context).textTheme.overline?.copyWith(
                    color: Palette.hint,
                    height: 0.1,
                  ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: Dimens.space8),
            child: TextFormField(
              key: widget.key,
              autofillHints: widget.autofillHints,
              enabled: widget.enable,
              obscureText: widget.obscureText ?? false,
              focusNode: widget.curFocusNode,
              keyboardType: widget.keyboardType,
              controller: widget.controller,
              textInputAction: widget.textInputAction,
              textAlign: widget.textAlign ?? TextAlign.start,
              minLines: widget.minLine ?? 1,
              maxLines: widget.maxLine ?? 10,
              inputFormatters: widget.inputFormatter,
              textAlignVertical: TextAlignVertical.center,
              style: Theme.of(context).textTheme.bodyText2,
              cursorColor: Palette.text,
              decoration: InputDecoration(
                prefixText: widget.prefixText,
                alignLabelWithHint: true,
                isDense: true,
                hintText: widget.hintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: Palette.disable),
                suffixIcon: widget.suffixIcon,
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimens.space12),
                  child: widget.prefixIcon,
                ),
                prefixIconConstraints: BoxConstraints(
                  minHeight: Dimens.space24,
                  maxHeight: Dimens.space24,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: Dimens.space12,
                  horizontal: Dimens.space16,
                ),
                enabledBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(Dimens.space4),
                  borderSide: const BorderSide(color: Palette.disable),
                ),
                disabledBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(Dimens.space4),
                  borderSide: const BorderSide(color: Palette.disable),
                ),
                errorStyle: Theme.of(context)
                    .textTheme
                    .overline
                    ?.copyWith(color: Palette.red),
                focusedErrorBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(Dimens.space4),
                  borderSide: const BorderSide(color: Palette.red),
                ),
                errorBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(Dimens.space4),
                  borderSide: const BorderSide(color: Palette.red),
                ),
                focusedBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(Dimens.space4),
                  borderSide: const BorderSide(color: Palette.primary),
                ),
              ),
              validator: widget.validator as String? Function(String?)?,
              onChanged: widget.onChanged,
              onTap: widget.onTap as void Function()?,
              onFieldSubmitted: (value) {
                setState(() {
                  fieldFocusChange(
                    context,
                    widget.curFocusNode ?? FocusNode(),
                    widget.nextFocusNode,
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  void fieldFocusChange(
    BuildContext context,
    FocusNode currentFocus,
    FocusNode? nextFocus,
  ) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
