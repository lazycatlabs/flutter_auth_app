import 'package:freezed_annotation/freezed_annotation.dart';

part 'register.freezed.dart';

@freezed
class Register with _$Register {
  const factory Register({String? message}) = _Register;
}
