import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'login_form.dart';

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
    _conEmail.dispose();
    _conPassword.dispose();
    _fnEmail.dispose();
    _fnPassword.dispose();
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
                    Theme.brightnessOf(context) == Brightness.dark
                        ? Images.icLauncherDark
                        : Images.icLauncher,
                    width: context.widthInPercent(70),
                  ),
                  SpacerV(value: Dimens.space50),
                  _LoginForm(
                    formKey: _formKey,
                    isValid: _isValid,
                    isPasswordVisible: _isPasswordVisible,
                    emailController: _conEmail,
                    passwordController: _conPassword,
                    emailFocusNode: _fnEmail,
                    passwordFocusNode: _fnPassword,
                  ),
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
}
