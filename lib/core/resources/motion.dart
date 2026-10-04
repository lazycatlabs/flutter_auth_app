import 'package:material_ui/material_ui.dart';

/// Shared durations and curves so every animation in the app moves with the
/// same rhythm.
class Motion {
  Motion._();

  static const Duration fast = Duration(milliseconds: 180);
  static const Duration medium = Duration(milliseconds: 320);
  static const Duration slow = Duration(milliseconds: 520);

  /// Delay between siblings of a staggered entrance.
  static const Duration stagger = Duration(milliseconds: 60);

  static const Curve emphasized = Curves.easeOutCubic;
  static const Curve standard = Curves.easeInOutCubic;
}
