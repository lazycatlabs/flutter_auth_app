import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

///*********************************************
///  flutter_auth_app |
///  register_page.dart
/// --------------------------------------------
/// Created by Mudassir 🧑🏻‍💻 @ lazycatlabs.com
/// on 📅 13/09/21 🕰 21:21 with ❤️
/// ✉️ : hey.mudassir@gmail.com
/// 🚀 : https://www.github.com/Lzyct
/// 🌐 : https://www.lazycatlabs.com
///*********************************************
/// © 2021 | All Right Reserved

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

  /// isPasswordVisible
  bool _isPasswordVisible = false;
  bool _isPasswordRepeatVisible = false;

  final _formValidator = <String, bool>{};

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: const MyAppBar().call(),
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (_, state) {
          state.whenOrNull(
            loading: () => context.show(),
            success: (data) {
              context.dismiss();

              data?.message?.toToastSuccess(context);

              /// back to login page after register success
              context.pop();
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).hintColor,
                    radius: Dimens.profilePicture + Dimens.space4,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(Images.icLauncher),
                      radius: Dimens.profilePicture,
                    ),
                  ),
                  SpacerV(value: Dimens.space50),
                  _registerForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _registerForm() {
    return BlocBuilder<ReloadFormCubit, ReloadFormState>(
      builder: (_, __) {
        return Column(
          children: [
            TextF(
              key: const Key("name"),
              focusNode: _fnName,
              textInputAction: TextInputAction.next,
              controller: _conName,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icon(
                Icons.person,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
              hint: 'Mudassir',
              label: Strings.of(context)!.name,
              isValid: _formValidator.putIfAbsent(
                "name",
                () => false,
              ),
              validatorListener: (String value) {
                _formValidator["name"] = value.isNotEmpty;
                context.read<ReloadFormCubit>().reload();
              },
              errorMessage: Strings.of(context)!.errorEmptyField,
            ),
            TextF(
              key: const Key("email"),
              focusNode: _fnEmail,
              textInputAction: TextInputAction.next,
              controller: _conEmail,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icon(
                Icons.alternate_email,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
              hint: 'mudassir@lazycatlabs.com',
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
              key: const Key("password"),
              focusNode: _fnPassword,
              textInputAction: TextInputAction.next,
              controller: _conPassword,
              keyboardType: TextInputType.text,
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
              obscureText: !_isPasswordVisible,
              hint: '••••••••••••',
              label: Strings.of(context)!.password,
              suffixIcon: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  _isPasswordVisible = !_isPasswordVisible;
                  context.read<ReloadFormCubit>().reload();
                },
                icon: Icon(
                  !_isPasswordVisible ? Icons.visibility_off : Icons.visibility,
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
              semantic: "password",
            ),
            TextF(
              key: const Key("repeat_password"),
              focusNode: _fnPasswordRepeat,
              textInputAction: TextInputAction.done,
              controller: _conPasswordRepeat,
              keyboardType: TextInputType.text,
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
              obscureText: !_isPasswordRepeatVisible,
              hint: '••••••••••••',
              label: Strings.of(context)!.passwordRepeat,
              suffixIcon: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  _isPasswordRepeatVisible = !_isPasswordRepeatVisible;
                  context.read<ReloadFormCubit>().reload();
                },
                icon: Icon(
                  !_isPasswordRepeatVisible
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
              ),
              isValid: _formValidator.putIfAbsent(
                "repeat_password",
                () => false,
              ),
              validatorListener: (String value) {
                _formValidator["repeat_password"] = value == _conPassword.text;
                context.read<ReloadFormCubit>().reload();
              },
              errorMessage: Strings.of(context)!.errorPasswordNotMatch,
              semantic: "repeat_password",
            ),
            SpacerV(value: Dimens.space24),
            Button(
              key: const Key("btn_register"),
              width: double.maxFinite,
              title: Strings.of(context)!.register,
              onPressed: _formValidator.validate()
                  ? () {
                      /// Validate form first
                      context.read<RegisterCubit>().register(
                            RegisterParams(
                              name: _conName.text,
                              email: _conEmail.text,
                              password: _conPassword.text,
                            ),
                          );
                    }
                  : null,
            ),
          ],
        );
      },
    );
  }
}
