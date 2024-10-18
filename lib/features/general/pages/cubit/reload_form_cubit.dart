import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reload_form_cubit.freezed.dart';
part 'reload_form_state.dart';

class ReloadFormCubit extends Cubit<ReloadFormState> {
  ReloadFormCubit() : super(const _Initial());

  void reload() {
    emit(const _Initial());
    emit(const _FormUpdated());
  }
}
