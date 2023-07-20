part of 'main_cubit.dart';

@freezed
class MainState with _$MainState {
  const factory MainState.loading() = _Loading;
  const factory MainState.success(DataHelper? data) = _Success;
}
