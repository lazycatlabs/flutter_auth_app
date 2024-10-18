import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_cubit.freezed.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const _Loading());

  int _currentIndex = 0;
  late List<DataHelper>? dataMenus;

  void updateIndex(int index, DataHelper? mockMenu, {BuildContext? context}) {
    emit(const _Loading());
    _currentIndex = index;
    if (context != null) {
      initMenu(context, mockMenu: mockMenu);
    }
    emit(_Success(mockMenu ?? dataMenus?[_currentIndex]));
  }

  void initMenu(BuildContext context, {DataHelper? mockMenu}) {
    dataMenus = [
      DataHelper(
        title: Strings.of(context)?.dashboard ?? "Dashboard",
        isSelected: true,
      ),
      DataHelper(title: Strings.of(context)?.settings ?? "Settings"),
      DataHelper(title: Strings.of(context)?.logout ?? "Logout"),
    ];
    updateIndex(_currentIndex, mockMenu);
  }

  bool onBackPressed(
    BuildContext context,
    GlobalKey<ScaffoldState> scaffoldState, {
    bool isDrawerClosed = false,
  }) {
    if (dataMenus == null) return false;
    if (dataMenus?[_currentIndex].title ==
        (Strings.of(context)?.dashboard ?? "Dashboard")) {
      return true;
    } else {
      if ((scaffoldState.currentState?.isEndDrawerOpen ?? false) ||
          isDrawerClosed) {
        //hide navigation drawer
        scaffoldState.currentState?.openDrawer();
      } else {
        for (final menu in dataMenus!) {
          menu.isSelected =
              menu.title == (Strings.of(context)?.dashboard ?? "Dashboard");
        }
      }

      return false;
    }
  }
}
