import 'package:flutter/material.dart';
import 'package:section_a/constants/dimens.dart';
import 'package:shimmer/shimmer.dart';

class MenuCardShimmer extends StatelessWidget {
  const MenuCardShimmer({super.key,});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(6, 0, 6, 12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(AppDimens.cardRadius)),
            color: Colors.white,
          ),
          width: AppDimens.cardWidth,
          height: AppDimens.cardHeight,
        ),
      ),
    );
  }
}

class AssignCardShimmer extends StatelessWidget {
  const AssignCardShimmer({super.key,});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
        itemCount: 2,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.fromLTRB(6, 0, 6, 12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(AppDimens.cardRadius)),
              color: Colors.white,
            ),
            width: AppDimens.cardWidth-20,
            height: AppDimens.cardHeight,
          ),
        ),
      ),
    );
  }
}

