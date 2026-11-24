import 'package:flutter_auth_app/core/core.dart';
import 'package:material_ui/material_ui.dart';

/// Entries of the navigation drawer. [route] is null for actions that do not
/// navigate (logout).
enum MainMenu {
  dashboard(Icons.space_dashboard_outlined, Routes.dashboard),
  settings(Icons.tune_rounded, Routes.settings),
  logout(Icons.logout_rounded, null);

  const MainMenu(this.icon, this.route);

  final IconData icon;
  final Routes? route;

  String title(BuildContext context) => switch (this) {
    dashboard => Strings.of(context)!.dashboard,
    settings => Strings.of(context)!.settings,
    logout => Strings.of(context)!.logout,
  };
}
