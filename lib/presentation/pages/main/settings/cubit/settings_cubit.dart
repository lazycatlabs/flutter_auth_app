import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCubit extends Cubit<int> {
  SettingsCubit() : super(0);

  void reloadWidget() {
    /// Generate random int to trigger bloc builder
    emit(Random().nextInt(1000));
  }
}
