import 'package:freezed_annotation/freezed_annotation.dart';

part 'general_token.freezed.dart';

@freezed
abstract class GeneralToken with _$GeneralToken {
  const factory GeneralToken({String? token}) = _GeneralToken;
}
