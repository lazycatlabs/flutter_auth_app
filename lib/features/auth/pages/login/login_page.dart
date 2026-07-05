import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /// Controller
  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _isValid = ValueNotifier(false);
  final _isPasswordVisible = ValueNotifier(false);

  /// Focus Node
  final _fnEmail = FocusNode();
  final _fnPassword = FocusNode();

  @override
  void dispose() {
    _isPasswordVisible.dispose();
    _isValid.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Parent(
    child: BlocListener<AuthCubit, AuthState>(
      listener: (_, state) => switch (state) {
        AuthStateLoading() => context.show(),
        AuthStateSuccess(:final data) => (() {
          context.dismiss();
          data.toString().toToastSuccess(context);

          TextInput.finishAutofillContext();
          context.goNamed(Routes.root.name);
        })(),
        AuthStateFailure(:final message) => (() {
          context.dismiss();
          message.toToastError(context);
        })(),
        _ => {},
      },
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Dimens.space24),
            child: AutofillGroup(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Theme.of(context).brightness == Brightness.dark
                        ? Images.icLauncherDark
                        : Images.icLauncher,
                    width: context.widthInPercent(70),
                  ),
                  SpacerV(value: Dimens.space50),
                  _loginForm(),
                  SpacerV(value: Dimens.space16),
                  ButtonText(
                    title: Strings.of(context)!.askRegister,
                    onPressed: () => context.pushNamed(Routes.register.name),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );

  Widget _loginForm() => Form(
    key: _formKey,
    onChanged: () =>
        _isValid.value = _formKey.currentState?.validate() ?? false,
    autovalidateMode: AutovalidateMode.onUnfocus,
    child: Column(
      children: [
        TextF(
          autoFillHints: const [AutofillHints.email],
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
          validator: (String? value) => !value.toString().isValidEmail()
              ? Strings.of(context)!.errorInvalidEmail
              : null,
        ),
        ValueListenableBuilder(
          valueListenable: _isPasswordVisible,
          builder: (_, bool isPasswordVisible, _) => TextF(
            autoFillHints: const [AutofillHints.password],
            key: const Key('password'),
            focusNode: _fnPassword,
            textInputAction: TextInputAction.done,
            controller: _conPassword,
            textInputType: TextInputType.text,
            prefixIcon: Icon(
              Icons.lock_outline,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
            obscureText: !isPasswordVisible,
            hint: 'pass123',
            label: Strings.of(context)!.password,
            suffixIcon: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () => _isPasswordVisible.value = !isPasswordVisible,
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
            ),
            validator: (String? value) => (value?.length ?? 0) < 5
                ? Strings.of(context)!.errorPasswordLength
                : null,
          ),
        ),
        SpacerV(value: Dimens.space24),
        ValueListenableBuilder(
          valueListenable: _isValid,
          builder: (_, bool isValid, _) => Button(
            title: Strings.of(context)!.login,
            width: double.maxFinite,
            onPressed: isValid
                ? () => context.read<AuthCubit>().login(
                    LoginParams(
                      email: _conEmail.text,
                      password: _conPassword.text,
                      osInfo: Platform.operatingSystem,
                      deviceInfo: Platform.localHostname,
                    ),
                  )
                : null,
          ),
        ),
      ],
    ),
  );
}
