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
        FadeSlideIn(
          delay: Motion.stagger * 3,
          child: TextF(
            key: const Key('name'),
            focusNode: nameFocusNode,
            textInputAction: TextInputAction.next,
            controller: nameController,
            textInputType: TextInputType.text,
            prefixIcon: const Icon(Icons.person_outline_rounded),
            hint: Strings.of(context)!.nameHint,
            label: Strings.of(context)!.name,
            validator: (value) => (value?.isEmpty ?? true)
                ? Strings.of(context)!.errorEmptyField
                : null,
          ),
        ),
        FadeSlideIn(
          delay: Motion.stagger * 4,
          child: TextF(
            key: const Key('email'),
            focusNode: emailFocusNode,
            textInputAction: TextInputAction.next,
            controller: emailController,
            textInputType: TextInputType.emailAddress,
            prefixIcon: const Icon(Icons.alternate_email_rounded),
            hint: Strings.of(context)!.emailHint,
            label: Strings.of(context)!.email,
            validator: (value) => !(value?.isValidEmail() ?? true)
                ? Strings.of(context)!.errorInvalidEmail
                : null,
          ),
        ),
        FadeSlideIn(
          delay: Motion.stagger * 5,
          child: ValueListenableBuilder(
            valueListenable: isPasswordVisible,
            builder: (_, passwordIsVisible, _) => TextF(
              key: const Key('password'),
              focusNode: passwordFocusNode,
              textInputAction: TextInputAction.next,
              controller: passwordController,
              textInputType: TextInputType.text,
              prefixIcon: const Icon(Icons.lock_outline_rounded),
              obscureText: !passwordIsVisible,
              hint: Strings.of(context)!.passwordHint,
              label: Strings.of(context)!.password,
              suffixIcon: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () => isPasswordVisible.value = !passwordIsVisible,
                icon: AnimatedSwitcher(
                  duration: Motion.fast,
                  transitionBuilder: (child, animation) =>
                      ScaleTransition(scale: animation, child: child),
                  child: Icon(
                    passwordIsVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    key: ValueKey(passwordIsVisible),
                  ),
                ),
              ),
              validator: (value) => (value?.length ?? 0) < 5
                  ? Strings.of(context)!.errorPasswordLength
                  : null,
              semantic: 'password',
            ),
          ),
        ),
        FadeSlideIn(
          delay: Motion.stagger * 6,
          child: ValueListenableBuilder(
            valueListenable: isPasswordRepeatVisible,
            builder: (_, passwordRepeatIsVisible, _) => TextF(
              key: const Key('repeat_password'),
              focusNode: passwordRepeatFocusNode,
              textInputAction: TextInputAction.done,
              controller: passwordRepeatController,
              textInputType: TextInputType.text,
              prefixIcon: const Icon(Icons.lock_outline_rounded),
              obscureText: !passwordRepeatIsVisible,
              hint: Strings.of(context)!.passwordHint,
              label: Strings.of(context)!.passwordRepeat,
              suffixIcon: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () =>
                    isPasswordRepeatVisible.value = !passwordRepeatIsVisible,
                icon: AnimatedSwitcher(
                  duration: Motion.fast,
                  transitionBuilder: (child, animation) =>
                      ScaleTransition(scale: animation, child: child),
                  child: Icon(
                    passwordRepeatIsVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    key: ValueKey(passwordRepeatIsVisible),
                  ),
                ),
              ),
              validator: (value) => (value ?? '') != passwordController.text
                  ? Strings.of(context)!.errorPasswordNotMatch
                  : null,
              semantic: 'repeat_password',
            ),
          ),
        ),
        SpacerV(value: Dimens.space24),
        FadeSlideIn(
          delay: Motion.stagger * 7,
          child: ValueListenableBuilder(
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
        ),
      ],
    ),
  );
}
