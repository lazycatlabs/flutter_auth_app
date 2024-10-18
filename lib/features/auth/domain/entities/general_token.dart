import 'package:freezed_annotation/freezed_annotation.dart';

part 'general_token.freezed.dart';

@freezed
class GeneralToken with _$GeneralToken {
  const factory GeneralToken({String? token}) = _GeneralToken;
}
