import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_cubit.freezed.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainStateLoading());

  int _currentIndex = 0;
  List<DataHelper> dataMenus = [];

  int get currentIndex => _currentIndex;

  void updateIndex(int index) {
    emit(const MainStateLoading());
    _currentIndex = index;
    dataMenus = [
      for (var menuIndex = 0; menuIndex < dataMenus.length; menuIndex++)
        dataMenus[menuIndex].copyWith(isSelected: menuIndex == _currentIndex),
    ];
    emit(MainStateSuccess(dataMenus[_currentIndex]));
  }

  void initMenu(List<DataHelper> menus) {
    dataMenus = menus;
    updateIndex(_currentIndex);
  }
}

@freezed
sealed class MainState with _$MainState {
  const factory MainState.loading() = MainStateLoading;

  const factory MainState.success(DataHelper? data) = MainStateSuccess;
}
