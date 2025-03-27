import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reload_form_cubit.freezed.dart';
part 'reload_form_stae.dart';

class ReloadFormCubit extends Cubit<ReloadFormState> {
  ReloadFormCubit() : super(const ReloadFormStateInitial());

  void reload() {
    emit(const ReloadFormStateInitial());
    emit(const ReloadFormStateFormUpdate());
  }
}
@freezed
abstract class ReloadFormState with _$ReloadFormState {
  const factory ReloadFormState.initial() = ReloadFormStateInitial;

  const factory ReloadFormState.formUpdated() = ReloadFormStateFormUpdate;
}
