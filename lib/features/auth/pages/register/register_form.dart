part of 'register_page.dart';

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({
    required this.formKey,
    required this.isValid,
    required this.isPasswordVisible,
    required this.isPasswordRepeatVisible,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.passwordRepeatController,
    required this.nameFocusNode,
    required this.emailFocusNode,
    required this.passwordFocusNode,
    required this.passwordRepeatFocusNode,
  });

  final GlobalKey<FormState> formKey;
  final ValueNotifier<bool> isValid;
  final ValueNotifier<bool> isPasswordVisible;
  final ValueNotifier<bool> isPasswordRepeatVisible;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController passwordRepeatController;
  final FocusNode nameFocusNode;
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;
  final FocusNode passwordRepeatFocusNode;

  @override
  Widget build(BuildContext context) => Form(
    key: formKey,
    onChanged: () => isValid.value = formKey.currentState?.validate() ?? false,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    child: Column(
      children: [
        TextF(
          key: const Key('name'),
          focusNode: nameFocusNode,
          textInputAction: TextInputAction.next,
          controller: nameController,
          textInputType: TextInputType.text,
          prefixIcon: Icon(
            Icons.person,
            color: TextTheme.of(context).bodyLarge?.color,
          ),
          hint: Strings.of(context)!.nameHint,
          label: Strings.of(context)!.name,
          validator: (value) => (value?.isEmpty ?? true)
              ? Strings.of(context)!.errorEmptyField
              : null,
        ),
        TextF(
          key: const Key('email'),
          focusNode: emailFocusNode,
          textInputAction: TextInputAction.next,
          controller: emailController,
          textInputType: TextInputType.emailAddress,
          prefixIcon: Icon(
            Icons.alternate_email,
            color: TextTheme.of(context).bodyLarge?.color,
          ),
          hint: Strings.of(context)!.emailHint,
          label: Strings.of(context)!.email,
          validator: (value) => !(value?.isValidEmail() ?? true)
              ? Strings.of(context)!.errorInvalidEmail
              : null,
        ),
        ValueListenableBuilder(
          valueListenable: isPasswordVisible,
          builder: (_, passwordIsVisible, _) => TextF(
            key: const Key('password'),
            focusNode: passwordFocusNode,
            textInputAction: TextInputAction.next,
            controller: passwordController,
            textInputType: TextInputType.text,
            prefixIcon: Icon(
              Icons.lock_outline,
              color: TextTheme.of(context).bodyLarge?.color,
            ),
            obscureText: !passwordIsVisible,
            hint: Strings.of(context)!.passwordHint,
            label: Strings.of(context)!.password,
            suffixIcon: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () => isPasswordVisible.value = !passwordIsVisible,
              icon: Icon(
                passwordIsVisible ? Icons.visibility : Icons.visibility_off,
              ),
            ),
            validator: (value) => (value?.length ?? 0) < 5
                ? Strings.of(context)!.errorPasswordLength
                : null,
            semantic: 'password',
          ),
        ),
        ValueListenableBuilder(
          valueListenable: isPasswordRepeatVisible,
          builder: (_, passwordRepeatIsVisible, _) => TextF(
            key: const Key('repeat_password'),
            focusNode: passwordRepeatFocusNode,
            textInputAction: TextInputAction.done,
            controller: passwordRepeatController,
            textInputType: TextInputType.text,
            prefixIcon: Icon(
              Icons.lock_outline,
              color: TextTheme.of(context).bodyLarge?.color,
            ),
            obscureText: !passwordRepeatIsVisible,
            hint: Strings.of(context)!.passwordHint,
            label: Strings.of(context)!.passwordRepeat,
            suffixIcon: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () =>
                  isPasswordRepeatVisible.value = !passwordRepeatIsVisible,
              icon: Icon(
                passwordRepeatIsVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
            ),
            validator: (value) => (value ?? '') != passwordController.text
                ? Strings.of(context)!.errorPasswordNotMatch
                : null,
            semantic: 'repeat_password',
          ),
        ),
        SpacerV(value: Dimens.space24),
        ValueListenableBuilder(
          valueListenable: isValid,
          builder: (_, formIsValid, _) => Button(
            key: const Key('btn_register'),
            width: double.maxFinite,
            title: Strings.of(context)!.register,
            onPressed: formIsValid
                ? () => context.read<RegisterCubit>().register(
                    RegisterParams(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                  )
                : null,
          ),
        ),
      ],
    ),
  );
}
