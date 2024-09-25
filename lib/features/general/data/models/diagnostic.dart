import 'package:freezed_annotation/freezed_annotation.dart';

part 'diagnostic.freezed.dart';
part 'diagnostic.g.dart';

@freezed
class Diagnostic with _$Diagnostic {
  const factory Diagnostic({
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "message") String? message,
  }) = _Diagnostic;

  factory Diagnostic.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticFromJson(json);
}
