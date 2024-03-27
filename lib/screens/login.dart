import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:section_a/bloc/login/login_bloc.dart';
import 'package:section_a/bloc/login/login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 0, 50, 200),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<LoginScreenBloc, LoginScreenState>(
              builder: (context, state) {
                return TextField(
                  onChanged: (newText) =>
                      BlocProvider.of<LoginScreenBloc>(context)
                          .updateInput(newText),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "MIS ID",
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: BlocBuilder<LoginScreenBloc, LoginScreenState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: state.isLoginDisabled ? null : () => BlocProvider.of<LoginScreenBloc>(context).login(context),
                    child: state.isLoading ? const CircularProgressIndicator() : const Text("LOGIN"),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
