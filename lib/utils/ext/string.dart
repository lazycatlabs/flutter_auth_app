import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';
import 'package:oktoast/oktoast.dart';

extension StringExtension on String {
  bool isValidEmail() => RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  ).hasMatch(this);

  //https://github.com/ponnamkarthik/FlutterToast/issues/262
  //coverage:ignore-start
  void toToastError(BuildContext context, {bool isUnitTest = false}) {
    try {
      final message = isEmpty ? Strings.of(context)!.errorGeneric : this;

      //dismiss before show toast
      dismissAllToast(showAnim: true);

      showToastWidget(
        Toast(
          bgColor: ColorScheme.of(context).error,
          icon: Icons.error,
          message: message,
          textColor: ColorScheme.of(context).onError,
        ),
        dismissOtherToast: true,
        position: ToastPosition.top,
        duration: const Duration(seconds: 3),
      );
    } catch (e, stackTrace) {
      if (!isUnitTest) {
        FirebaseCrashLogger().nonFatalError(error: e, stackTrace: stackTrace);
      }
      log.e('Failed to show toast', error: e, stackTrace: stackTrace);
    }
  }

  void toToastSuccess(BuildContext context, {bool isUnitTest = false}) {
    try {
      final message = isEmpty ? Strings.of(context)!.success : this;

      //dismiss before show toast
      dismissAllToast(showAnim: true);

      // showToast(msg)
      showToastWidget(
        Toast(
          bgColor: ColorScheme.of(context).primary,
          icon: Icons.check_circle,
          message: message,
          textColor: ColorScheme.of(context).onPrimary,
        ),
        dismissOtherToast: true,
        position: ToastPosition.top,
        duration: const Duration(seconds: 3),
      );
    } catch (e, stackTrace) {
      if (!isUnitTest) {
        FirebaseCrashLogger().nonFatalError(error: e, stackTrace: stackTrace);
      }
      log.e('Failed to show toast', error: e, stackTrace: stackTrace);
    }
  }

  void toToastLoading(BuildContext context, {bool isUnitTest = false}) {
    try {
      final message = isEmpty ? Strings.of(context)!.pleaseWait : this;
      //dismiss before show toast
      dismissAllToast(showAnim: true);

      showToastWidget(
        Toast(
          bgColor: ColorScheme.of(context).tertiary,
          icon: Icons.info,
          message: message,
          textColor: ColorScheme.of(context).onTertiary,
        ),
        dismissOtherToast: true,
        position: ToastPosition.top,
        duration: const Duration(seconds: 3),
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
