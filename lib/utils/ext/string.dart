import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';
import 'package:toastification/toastification.dart';

extension StringExtension on String {
  bool isValidEmail() => RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  ).hasMatch(this);

  //coverage:ignore-start
  void toToastError(BuildContext context, {bool isUnitTest = false}) =>
      _showToast(
        context,
        message: isEmpty ? Strings.of(context)!.errorGeneric : this,
        icon: Icons.error,
        bgColor: ColorScheme.of(context).error,
        textColor: ColorScheme.of(context).onError,
        isUnitTest: isUnitTest,
      );

  void toToastSuccess(BuildContext context, {bool isUnitTest = false}) =>
      _showToast(
        context,
        message: isEmpty ? Strings.of(context)!.success : this,
        icon: Icons.check_circle,
        bgColor: ColorScheme.of(context).primary,
        textColor: ColorScheme.of(context).onPrimary,
        isUnitTest: isUnitTest,
      );

  void toToastLoading(BuildContext context, {bool isUnitTest = false}) =>
      _showToast(
        context,
        message: isEmpty ? Strings.of(context)!.pleaseWait : this,
        icon: Icons.info,
        bgColor: ColorScheme.of(context).tertiary,
        textColor: ColorScheme.of(context).onTertiary,
        isUnitTest: isUnitTest,
      );

  /// Shows one [Toast] at the top, replacing any toast already visible.
  static void _showToast(
    BuildContext context, {
    required String message,
    required IconData icon,
    required Color bgColor,
    required Color textColor,
    required bool isUnitTest,
  }) {
    try {
      toastification
        ..dismissAll(delayForAnimation: false)
        ..showCustom(
          context: context,
          alignment: Alignment.topCenter,
          autoCloseDuration: const Duration(seconds: 3),
          builder: (_, _) => SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.only(top: Dimens.space8),
              child: Toast(
                bgColor: bgColor,
                icon: icon,
                message: message,
                textColor: textColor,
              ),
            ),
          ),
        );
    } catch (e, stackTrace) {
      if (!isUnitTest) {
        FirebaseCrashLogger().nonFatalError(error: e, stackTrace: stackTrace);
      }
      log.e('Failed to show toast', error: e, stackTrace: stackTrace);
    }
  }

  //coverage:ignore-end

  /// Formats an ISO-8601 string; returns `-` when it cannot be parsed.
  /// [locale] defaults to `Intl.defaultLocale`.
  String toStringDateAlt({
    bool isShort = false,
    bool isToLocal = true,
    String? locale,
  }) {
    final date = DateTime.tryParse(this);
    if (date == null) {
      return '-';
    }
    return DateFormat(
      "dd ${isShort ? "MMM" : "MMMM"} yyyy HH:mm",
      locale,
    ).format(isToLocal ? date.toLocal() : date);
  }
}
