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

  bool _isPasswordVisible = false;

  /// Focus Node
  final _fnEmail = FocusNode();
  final _fnPassword = FocusNode();

  /// Global key
  final _formValidator = <String, bool>{};

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: BlocListener<AuthCubit, AuthState>(
        listener: (_, state)
        {
          state.whenOrNull(
            loading: () => context.show(),
            success: (data) {
              context.dismiss();
              data.toString().toToastSuccess(context);

              TextInput.finishAutofillContext();
              context.goNamed(Routes.root.name);
            },
            failure: (message) {
              context.dismiss();
              message.toToastError(context);
            },
          );
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
                    ButtonText(
                      title: Strings.of(context)!.askRegister,
                      onPressed: () {
                        /// Direct to register page
                        context.pushNamed(Routes.register.name);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginForm() => BlocBuilder<ReloadFormCubit, ReloadFormState>(
        builder: (_, __) {
          return Column(
            children: [
              TextF(
                autoFillHints: const [AutofillHints.email],
                key: const Key("email"),
                focusNode: _fnEmail,
                textInputAction: TextInputAction.next,
                controller: _conEmail,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icon(
                  Icons.alternate_email,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
                hint: "mudassir@lazycatlabs.com",
                label: Strings.of(context)!.email,
                isValid: _formValidator.putIfAbsent(
                  "email",
                  () => false,
                ),
                validatorListener: (String value) {
                  _formValidator["email"] = value.isValidEmail();
                  context.read<ReloadFormCubit>().reload();
                },
                errorMessage: Strings.of(context)!.errorInvalidEmail,
              ),
              TextF(
                autoFillHints: const [AutofillHints.password],
                key: const Key("password"),
                focusNode: _fnPassword,
                textInputAction: TextInputAction.done,
                controller: _conPassword,
                keyboardType: TextInputType.text,
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
                obscureText: !_isPasswordVisible,
                hint: 'pass123',
                label: Strings.of(context)!.password,
                suffixIcon: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    _isPasswordVisible = !_isPasswordVisible;
                    context.read<ReloadFormCubit>().reload();
                  },
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
                isValid: _formValidator.putIfAbsent(
                  "password",
                  () => false,
                ),
                validatorListener: (String value) {
                  _formValidator["password"] = value.length > 5;
                  context.read<ReloadFormCubit>().reload();
                },
                errorMessage: Strings.of(context)!.errorPasswordLength,
              ),
              SpacerV(value: Dimens.space24),
              Button(
                title: Strings.of(context)!.login,
                width: double.maxFinite,
                onPressed: _formValidator.validate()
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
            ],
          );
        },
      );
}
