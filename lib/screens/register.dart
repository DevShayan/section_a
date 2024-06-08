import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:section_a/bloc/register/reg_bloc.dart';
import 'package:section_a/constants/colors.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                  "REGISTER",
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                const SizedBox(height: 50),
            
                TextField(
                  onChanged: (newText) => BlocProvider.of<RegisterBloc>(context).updateMis(newText),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(99))
                    ),
                    labelText: " MIS ID",
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  onChanged: (newText) => BlocProvider.of<RegisterBloc>(context).updateName(newText),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(99))
                    ),
                    labelText: " Name",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:  24),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.appAccent,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => BlocProvider.of<RegisterBloc>(context).onRegisterPress(context),
                    child: const SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Center(
                        child: Text(
                          "REGISTER",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
