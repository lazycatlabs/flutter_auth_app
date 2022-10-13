import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/domain/domain.dart';
import 'package:flutter_auth_app/presentation/presentation.dart';
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
  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();
  final _conPasswordRepeat = TextEditingController();

  /// Focus Node
  final _fnEmail = FocusNode();
  final _fnPassword = FocusNode();
  final _fnPasswordRepeat = FocusNode();

  /// Handle state visibility password
  bool _isPasswordHide = true;
  bool _isPasswordRepeatHide = true;

  /// Global key form
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: const MyAppBar().call(),
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (_, state) {
          switch (state.status) {
            case RegisterStatus.loading:
              context.show();
              break;
            case RegisterStatus.success:
              context.dismiss();

              /// back to login page after register success
              context.pop();
              break;
            case RegisterStatus.failure:
              context.dismiss();
              state.message.toString().toToastError();
              break;
          }
        },
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(Dimens.space24),
              child: Form(
                key: _keyForm,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Palette.primary,
                      radius: Dimens.profilePicture + Dimens.space4,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(Images.icLauncher),
                        radius: Dimens.profilePicture,
                      ),
                    ),
                    const SpacerV(),
                    TextF(
                      key: const Key("email"),
                      curFocusNode: _fnEmail,
                      nextFocusNode: _fnPassword,
                      textInputAction: TextInputAction.next,
                      controller: _conEmail,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(
                        Icons.alternate_email,
                        color: Theme.of(context).textTheme.bodyText1?.color,
                      ),
                      hintText: 'johndoe@gmail.com',
                      hint: Strings.of(context)!.email,
                      validator: (String? value) => value != null
                          ? (!value.isValidEmail()
                              ? Strings.of(context)?.errorInvalidEmail
                              : null)
                          : null,
                    ),
                    TextF(
                      key: const Key("password"),
                      curFocusNode: _fnPassword,
                      nextFocusNode: _fnPasswordRepeat,
                      textInputAction: TextInputAction.next,
                      controller: _conPassword,
                      keyboardType: TextInputType.text,
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Theme.of(context).textTheme.bodyText1?.color,
                      ),
                      obscureText: _isPasswordHide,
                      hintText: '••••••••••••',
                      maxLine: 1,
                      hint: Strings.of(context)!.password,
                      suffixIcon: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          setState(
                            () {
                              _isPasswordHide = !_isPasswordHide;
                            },
                          );
                        },
                        icon: Icon(
                          _isPasswordHide
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      validator: (String? value) => value != null
                          ? (value.length < 3
                              ? Strings.of(context)?.errorEmptyField
                              : null)
                          : null,
                    ),
                    TextF(
                      key: const Key("repeat_password"),
                      curFocusNode: _fnPasswordRepeat,
                      textInputAction: TextInputAction.done,
                      controller: _conPasswordRepeat,
                      keyboardType: TextInputType.text,
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Theme.of(context).textTheme.bodyText1?.color,
                      ),
                      obscureText: _isPasswordRepeatHide,
                      hintText: '••••••••••••',
                      maxLine: 1,
                      hint: Strings.of(context)!.passwordRepeat,
                      suffixIcon: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          setState(
                            () {
                              _isPasswordRepeatHide = !_isPasswordRepeatHide;
                            },
                          );
                        },
                        icon: Icon(
                          _isPasswordRepeatHide
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      validator: (String? value) => value != null
                          ? (value != _conPassword.text
                              ? Strings.of(context)?.errorPasswordNotMatch
                              : null)
                          : null,
                    ),
                    SpacerV(value: Dimens.space24),
                    Button(
                      key: const Key("btn_register"),
                      title: Strings.of(context)!.register,
                      onPressed: () {
                        /// Validate form first
                        if (_keyForm.currentState?.validate() ?? false) {
                          context.read<RegisterCubit>().register(
                                RegisterParams(
                                  email: _conEmail.text,
                                  password: _conPassword.text,
                                ),
                              );
                        }
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
}
