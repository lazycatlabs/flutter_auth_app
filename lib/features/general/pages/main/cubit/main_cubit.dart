import 'package:flutter_auth_app/features/general/pages/main/main_menu.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Holds the drawer entry that is currently shown.
class MainCubit extends Cubit<MainMenu> {
  MainCubit() : super(MainMenu.dashboard);

  void select(MainMenu menu) => emit(menu);
}
