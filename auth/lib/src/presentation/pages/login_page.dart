import 'package:auth/src/di/injector.dart';
import 'package:auth/src/presentation/blocs/auth_bloc.dart';
import 'package:auth/src/presentation/widgets/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  static const route = '/loginPage';

  // Bloc
  final authBloc = sl<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => authBloc,
        child: LoginView(
          authBloc: authBloc,
        ),
      ),
    );
  }
}
