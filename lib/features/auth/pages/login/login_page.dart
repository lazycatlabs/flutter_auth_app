import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

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
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(Dimens.space24),
            child: AutofillGroup(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthHeader(
                    title: Strings.of(context)!.welcomeBack,
                    subtitle: Strings.of(context)!.loginSubtitle,
                  ),
                  SpacerV(value: Dimens.space36),
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
                  FadeSlideIn(
                    delay: Motion.stagger * 6,
                    child: Center(
                      child: ButtonText(
                        title: Strings.of(context)!.askRegister,
                        onPressed: () =>
                            context.pushNamed(Routes.register.name),
                      ),
                    ),
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
