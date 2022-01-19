import 'dart:developer';

import 'package:auth/src/data/models/models.dart';
import 'package:auth/src/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:auth/src/presentation/blocs/auth_bloc.dart';
import 'package:shared/shared.dart';
import 'package:core/core.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key, required this.authBloc}) : super(key: key);

  final AuthBloc authBloc;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // Controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // Key
  final _formLoginKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final labels = context.localizations;
    final size = MediaQuery.of(context).size;

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          AppSnackbar.snackbarFailure(labels.state.failure, state.message);
          log('Fail');
          // ScaffoldMessenger.of(context)
          //     .showSnackBar(SnackBar(content: Text('Halo')));
        }

        if (state is AuthSuccess) {
          // Get.offAllNamed<void>(DashboardPage.route);
          AppSnackbar.snackbarFailure(labels.state.failure, 'Success');

          log('Success');
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 28),
                    // SizedBox(
                    //   height: size.height / 4,
                    //   child: Image.asset(
                    //     AssetsConstants.logo,
                    //     fit: BoxFit.contain,
                    //   ),
                    // ),
                    const SizedBox(height: 28),
                    FormLogin(
                      formLoginKey: _formLoginKey,
                      usernameController: usernameController,
                      passwordController: passwordController,
                      onLogin: onLogin,
                    ),
                  ],
                ),
              ),
            ),
            if (state is AuthLoading)
              const LoadingWithText(
                loadingText: 'Loading',
              ),
          ],
        );
      },
    );
  }

  void onLogin() {
    if (_formLoginKey.currentState!.validate()) {
      _formLoginKey.currentState!.save();

      final body = LoginBody(
        username: usernameController.text,
        password: passwordController.text,
      );

      widget.authBloc.add(LoginEvent(body));
    }
  }
}
