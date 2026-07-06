import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
        _ => {},
      },
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Dimens.space24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Theme.of(context).brightness == Brightness.dark
                      ? Images.icLauncherDark
                      : Images.icLauncher,
                  width: context.widthInPercent(70),
                ),
                _registerForm(),
              ],
            ),
          ),
        ),
      ),
    ),
  );

  Widget _registerForm() => Form(
    key: _formKey,
    onChanged: () =>
        _isValid.value = _formKey.currentState?.validate() ?? false,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    child: Column(
      children: [
        TextF(
          key: const Key('name'),
          focusNode: _fnName,
          textInputAction: TextInputAction.next,
          controller: _conName,
          textInputType: TextInputType.text,
          prefixIcon: Icon(
            Icons.person,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
          hint: 'Mudassir',
          label: Strings.of(context)!.name,
          validator: (value) => (value?.isEmpty ?? true)
              ? Strings.of(context)!.errorEmptyField
              : null,
        ),
        TextF(
          key: const Key('email'),
          focusNode: _fnEmail,
          textInputAction: TextInputAction.next,
          controller: _conEmail,
          textInputType: TextInputType.emailAddress,
          prefixIcon: Icon(
            Icons.alternate_email,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
          hint: 'mudassir@lazycatlabs.com',
          label: Strings.of(context)!.email,
          validator: (value) => !(value?.isValidEmail() ?? true)
              ? Strings.of(context)!.errorInvalidEmail
              : null,
        ),
        ValueListenableBuilder(
          valueListenable: _isPasswordVisible,
          builder: (_, bool isPasswordVisible, _) => TextF(
            key: const Key('password'),
            focusNode: _fnPassword,
            textInputAction: TextInputAction.next,
            controller: _conPassword,
            textInputType: TextInputType.text,
            prefixIcon: Icon(
              Icons.lock_outline,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
            obscureText: !isPasswordVisible,
            hint: '••••••••••••',
            label: Strings.of(context)!.password,
            suffixIcon: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () => _isPasswordVisible.value = !isPasswordVisible,
              icon: Icon(
                !isPasswordVisible ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (String? value) => (value?.length ?? 0) < 5
                ? Strings.of(context)!.errorPasswordLength
                : null,
            semantic: 'password',
          ),
        ),
        ValueListenableBuilder(
          valueListenable: _isPasswordRepeatVisible,
          builder: (_, bool isPasswordRepeatVisible, _) => TextF(
            key: const Key('repeat_password'),
            focusNode: _fnPasswordRepeat,
            textInputAction: TextInputAction.done,
            controller: _conPasswordRepeat,
            textInputType: TextInputType.text,
            prefixIcon: Icon(
              Icons.lock_outline,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
            obscureText: !isPasswordRepeatVisible,
            hint: '••••••••••••',
            label: Strings.of(context)!.passwordRepeat,
            suffixIcon: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                _isPasswordRepeatVisible.value = !isPasswordRepeatVisible;
              },
              icon: Icon(
                !isPasswordRepeatVisible
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
            validator: (value) => (value ?? '') != _conPassword.text
                ? Strings.of(context)!.errorPasswordNotMatch
                : null,
            semantic: 'repeat_password',
          ),
        ),
        SpacerV(value: Dimens.space24),
        ValueListenableBuilder(
          valueListenable: _isValid,
          builder: (_, bool isValid, _) => Button(
            key: const Key('btn_register'),
            width: double.maxFinite,
            title: Strings.of(context)!.register,
            onPressed: isValid
                ? () => context.read<RegisterCubit>().register(
                    RegisterParams(
                      name: _conName.text,
                      email: _conEmail.text,
                      password: _conPassword.text,
                    ),
                  )
                : null,
          ),
        ),
      ],
    ),
  );
}
