import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:section_a/bloc/login/login_bloc.dart';
import 'package:section_a/bloc/login/login_state.dart';
import 'package:section_a/constants/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              CircularPercentIndicator(
                radius: 50,
                lineWidth: 12,
                percent: 1,
                progressColor: AppColors.appAccent,
              ),
              const SizedBox(height: 16),
          
              const Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 20
                ),
              ),
              const SizedBox(height: 50),
          
              BlocBuilder<LoginScreenBloc, LoginScreenState>(
                builder: (context, state) {
                  return TextField(
                    onChanged: (newText) => BlocProvider.of<LoginScreenBloc>(context).updateInput(newText),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(99))
                      ),
                      labelText: " MIS ID",
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:  24),
                child: BlocBuilder<LoginScreenBloc, LoginScreenState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.appAccent,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: state.isLoginDisabled ? null : () => BlocProvider.of<LoginScreenBloc>(context).login(context),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: Center(
                          child: state.isLoading ? const CircularProgressIndicator() : const Text(
                            "LOGIN",
                            style: TextStyle(
                              fontSize: 16
                            ),
                          )
                        ),
                      ) ,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
