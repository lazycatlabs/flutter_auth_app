part of 'reload_form_cubit.dart';

@freezed
abstract class ReloadFormState with _$ReloadFormState {
  const factory ReloadFormState.initial() = _Initial;

  const factory ReloadFormState.formUpdated() = _FormUpdated;
}
