import 'package:flutter/material.dart';
import 'package:section_a/constants/colors.dart';
import 'package:section_a/constants/dimens.dart';

class CCard extends StatelessWidget {
  final Widget child;
  final Color? color;

  const CCard({
    super.key,
    required this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Container(
        decoration: (color == null) ?
        BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(AppDimens.cardRadius)),
          color: AppColors.cardBg,
        ):
        BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(AppDimens.cardRadius)),
          gradient: RadialGradient(
            center: const Alignment(1, -1),
            radius: 1.4,
            focal: const Alignment(2, -2),
            colors: [
              Colors.white70,
              color!,
            ]
          ),
        ),
        child: child
      ),
    );
  }
}
