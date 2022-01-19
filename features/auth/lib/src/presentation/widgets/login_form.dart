import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shared/shared.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({
    Key? key,
    required this.formLoginKey,
    required this.usernameController,
    required this.passwordController,
    this.onLogin,
  }) : super(key: key);

  final GlobalKey<FormState> formLoginKey;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final Function()? onLogin;

  @override
  Widget build(BuildContext context) {
    final labels = context.localizations;

    return Form(
      key: formLoginKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            labels.auth.login,
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: 20),
          _UsernameField(
            key: const Key('usernameField'),
            usernameController: usernameController,
            labels: labels,
          ),
          const SizedBox(height: 10),
          _PasswordField(
            key: const Key('passwordField'),
            passwordController: passwordController,
            labels: labels,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            key: const Key('loginBtn'),
            onPressed: onLogin,
            child: Text(labels.auth.login),
          ),
        ],
      ),
    );
  }
}

class _UsernameField extends StatelessWidget {
  const _UsernameField({
    Key? key,
    required this.usernameController,
    required this.labels,
  }) : super(key: key);

  final TextEditingController usernameController;
  final AppLocalizationsData labels;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: usernameController,
      decoration: InputDecoration(
        hintText: labels.form.username,
        prefixIcon: const Icon(Icons.person),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.next,
      validator: RequiredValidator(
        errorText: labels.form.required.username,
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({
    Key? key,
    required this.passwordController,
    required this.labels,
  }) : super(key: key);

  final TextEditingController passwordController;
  final AppLocalizationsData labels;

  @override
  Widget build(BuildContext context) {
    final obscure = ValueNotifier<bool>(true);

    return ValueListenableBuilder(
      valueListenable: obscure,
      builder: (context, _, __) => TextFormField(
        controller: passwordController,
        obscureText: obscure.value,
        decoration: InputDecoration(
          hintText: labels.form.password,
          prefixIcon: const Icon(Icons.password),
          suffixIcon: IconButton(
            key: const Key('obscureButton'),
            onPressed: () {
              obscure.value = !obscure.value;
            },
            icon: obscure.value
                ? const Icon(CupertinoIcons.eye)
                : const Icon(CupertinoIcons.eye_slash),
          ),
        ),
        validator: RequiredValidator(
          errorText: labels.form.required.password,
        ),
      ),
    );
  }
}
