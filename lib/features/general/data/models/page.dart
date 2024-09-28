import 'package:freezed_annotation/freezed_annotation.dart';

part 'page.freezed.dart';
part 'page.g.dart';

@freezed
class Page with _$Page {
  const factory Page({
    @JsonKey(name: "currentPage") int? currentPage,
    @JsonKey(name: "perPage") int? perPage,
    @JsonKey(name: "lastPage") int? lastPage,
    @JsonKey(name: "total") int? total,
  }) = _Page;

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);
}
