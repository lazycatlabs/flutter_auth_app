import 'package:flutter_auth_app/dependencies_injection.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCubit extends Cubit<DataHelper> {
  SettingsCubit() : super(DataHelper(type: "en"));

  void updateTheme(ActiveTheme activeTheme) {
    sl<PrefManager>().theme = activeTheme.name;
    emit(DataHelper(activeTheme: activeTheme, type: sl<PrefManager>().locale));
  }

  void updateLanguage(String type) {
    /// Update locale code
    sl<PrefManager>().locale = type;
    emit(DataHelper(type: type, activeTheme: getActiveTheme()));
  }

  ActiveTheme getActiveTheme() {
    return ActiveTheme.values
        .firstWhere((element) => element.name == sl<PrefManager>().theme);
  }
}
