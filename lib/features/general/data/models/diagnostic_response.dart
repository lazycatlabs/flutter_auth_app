import 'package:flutter_auth_app/features/general/general.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'diagnostic_response.freezed.dart';
part 'diagnostic_response.g.dart';

@freezed
class DiagnosticResponse with _$DiagnosticResponse {
  const factory DiagnosticResponse({
    @JsonKey(name: "diagnostic") Diagnostic? diagnostic,
  }) = _DiagnosticResponse;

  factory DiagnosticResponse.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticResponseFromJson(json);
}
