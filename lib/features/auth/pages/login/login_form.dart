part of 'login_page.dart';

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    required this.formKey,
    required this.isValid,
    required this.isPasswordVisible,
    required this.emailController,
    required this.passwordController,
    required this.emailFocusNode,
    required this.passwordFocusNode,
  });

  final GlobalKey<FormState> formKey;
  final ValueNotifier<bool> isValid;
  final ValueNotifier<bool> isPasswordVisible;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;

  @override
  Widget build(BuildContext context) => Form(
    key: formKey,
    onChanged: () => isValid.value = formKey.currentState?.validate() ?? false,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    child: Column(
      children: [
        TextF(
          autoFillHints: const [AutofillHints.email],
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
          validator: (value) => !value.toString().isValidEmail()
              ? Strings.of(context)!.errorInvalidEmail
              : null,
        ),
        ValueListenableBuilder(
          valueListenable: isPasswordVisible,
          builder: (_, passwordIsVisible, _) => TextF(
            autoFillHints: const [AutofillHints.password],
            key: const Key('password'),
            focusNode: passwordFocusNode,
            textInputAction: TextInputAction.done,
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
          ),
        ),
        SpacerV(value: Dimens.space24),
        ValueListenableBuilder(
          valueListenable: isValid,
          builder: (_, formIsValid, _) => Button(
            title: Strings.of(context)!.login,
            width: double.maxFinite,
            onPressed: formIsValid
                ? () => context.read<AuthCubit>().login(
                    LoginParams(
                      email: emailController.text,
                      password: passwordController.text,
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
