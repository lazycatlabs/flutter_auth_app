import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

part 'register_form.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  /// Controller
  final _conName = TextEditingController();
  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();
  final _conPasswordRepeat = TextEditingController();

  /// Focus Node
  final _fnName = FocusNode();
  final _fnEmail = FocusNode();
  final _fnPassword = FocusNode();
  final _fnPasswordRepeat = FocusNode();

  final _formKey = GlobalKey<FormState>();
  final _isValid = ValueNotifier(false);

  /// isPasswordVisible
  final _isPasswordVisible = ValueNotifier(false);
  final _isPasswordRepeatVisible = ValueNotifier(false);

  @override
  void dispose() {
    _isPasswordVisible.dispose();
    _isPasswordRepeatVisible.dispose();
    _isValid.dispose();

    _conName.dispose();
    _conEmail.dispose();
    _conPassword.dispose();
    _conPasswordRepeat.dispose();

    /// Focus Node
    _fnName.dispose();
    _fnEmail.dispose();
    _fnPassword.dispose();
    _fnPasswordRepeat.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Parent(
    appBar: const MyAppBar().call(),
    child: BlocListener<RegisterCubit, RegisterState>(
      listener: (_, state) => switch (state) {
        RegisterStateLoading() => context.show(),
        RegisterStateSuccess(:final data) => (() {
          context.dismiss();

          data?.message?.toToastSuccess(context);

          /// back to login page after register success
          context.pop();
        })(),
        RegisterStateFailure(:final message) => (() {
          context.dismiss();
          message.toToastError(context);
        })(),
      },
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          Dimens.space24,
          Dimens.space8,
          Dimens.space24,
          Dimens.space24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthHeader(
              title: Strings.of(context)!.createAccount,
              subtitle: Strings.of(context)!.registerSubtitle,
            ),
            SpacerV(value: Dimens.space30),
            _RegisterForm(
              formKey: _formKey,
              isValid: _isValid,
              isPasswordVisible: _isPasswordVisible,
              isPasswordRepeatVisible: _isPasswordRepeatVisible,
              nameController: _conName,
              emailController: _conEmail,
              passwordController: _conPassword,
              passwordRepeatController: _conPasswordRepeat,
              nameFocusNode: _fnName,
              emailFocusNode: _fnEmail,
              passwordFocusNode: _fnPassword,
              passwordRepeatFocusNode: _fnPasswordRepeat,
            ),
          ],
        ),
      ),
    ),
  );
}
