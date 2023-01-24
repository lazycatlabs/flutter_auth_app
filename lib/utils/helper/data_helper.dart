import 'package:flutter/material.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_helper.freezed.dart';

@unfreezed
class DataHelper with _$DataHelper {
  factory DataHelper({
    String? title,
    String? desc,
    String? iconPath,
    IconData? icon,
    String? url,
    String? type,
    int? id,
    @Default(false) bool isSelected,
    @Default(ActiveTheme.light) ActiveTheme activeTheme,
  }) = _DataHelper;
}
