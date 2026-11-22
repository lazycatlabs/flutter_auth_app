import 'package:flutter_auth_app/core/core.dart';
import 'package:material_ui/material_ui.dart';

extension ContextExtensions on BuildContext {
  double widthInPercent(double percent) {
    final toDouble = percent / 100;

    return MediaQuery.of(this).size.width * toDouble;
  }

  double heightInPercent(double percent) {
    final toDouble = percent / 100;

    return MediaQuery.of(this).size.height * toDouble;
  }

  /// Context of the loading dialog currently shown, if any
  static BuildContext? _loadingContext;

  Future<void> show() => showDialog(
    context: this,
    barrierDismissible: false,
    builder: (c) {
      _loadingContext = c;

      return PopScope(
        canPop: false,
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: ColorScheme.of(c).surface,
                borderRadius: BorderRadius.circular(Dimens.cornerRadius),
              ),
              margin: EdgeInsets.symmetric(horizontal: Dimens.space30),
              padding: EdgeInsets.all(Dimens.space24),
              child: const Loading(),
            ),
          ),
        ),
      );
    },
  );

  void dismiss() {
    final loadingContext = _loadingContext;
    _loadingContext = null;
    if (loadingContext != null && loadingContext.mounted) {
      Navigator.pop(loadingContext);
    }
  }
}
