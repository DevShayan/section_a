import 'package:flutter/material.dart';
import 'package:section_a/constants/colors.dart';

class CPrimaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? child;

  const CPrimaryButton({
    super.key,
    required this.onPressed,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.appAccent,
        foregroundColor: Colors.white,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}