import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:section_a/bloc/home/home_bloc.dart';
import 'package:section_a/bloc/home/home_state.dart';
import 'package:section_a/constants/colors.dart';
import 'package:section_a/constants/dimens.dart';
import 'package:section_a/constants/functions.dart';
import 'package:section_a/pojos/assignments.dart';
import 'package:section_a/pojos/curr_user.dart';
import 'package:section_a/routes/routes.dart';
import 'package:section_a/screens/assignment.dart';
import 'package:section_a/ui_widgets/c_card.dart';
import 'package:section_a/ui_widgets/c_skeleton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeScreenBloc>(context).fetchData();

    setCardWidth(MediaQuery.of(context).size.width);

    return Scaffold(
      appBar: AppBar(
        title: Text("Hello ${CurrUser.name}"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimens.horizScreenSpacing),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeading(title: "Upcoming Assignments"),
              SizedBox(
                height: 140,
                child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
                  builder: (context, state) {
                    if (!state.assignmentsFetched) {
                      return const AssignCardShimmer();
                    }
                    return ListView.builder(
                      itemCount: Assignments.assignmentsList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => MenuCard(
                        cardColor: AppColors.assCardColor,
                        textColor: Colors.white,
                        cardTitle: Assignments.assignmentsList[index].title,
                        width: AppDimens.cardWidth-20,
                        onTap: () {
                          showMaterialModalBottomSheet(
                            expand: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft:  Radius.circular(AppDimens.cardRadius),
                                topRight:  Radius.circular(AppDimens.cardRadius),
                              )
                            ),
                            context: context,
                            builder: (context) => AssignmentScreen(
                              index: index
                            ),
                          );
                        },
                        
                      ),
                    );
                  },
                ),
              ),
              const HomeHeading(title: "Insights"),
              Wrap(
                direction: Axis.horizontal,
                children: <Widget>[
                  AttnCard(
                    width: AppDimens.cardWidth,
                  ),
                  GradesCard(
                    width: AppDimens.cardWidth,
                  ),
                ],
              ),

              const HomeHeading(title: "Other"),
              BlocBuilder<HomeScreenBloc, HomeScreenState>(
                builder: (context, state) {
                  if (!state.scheduleFetched) {
                    return const MenuCardShimmer();
                  }
                  return MenuCard(
                    cardTitle: "Schedule",
                    width: AppDimens.cardWidth,
                    onTap: () => Navigator.pushNamed(context, AppRoutes.schedule),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeHeading extends StatelessWidget {
  final String title;

  const HomeHeading({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 40, 0, 10),
      child: Text(
        title,
        style: TextStyle(fontSize: AppDimens.heading3Size),
      ),
    );
  }
}

class AttnCard extends StatelessWidget {
  final double width;

  const AttnCard({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
        if (state.attnP == null) {
          return const MenuCardShimmer();
        }
        return MenuCard(
          cardColor: AppColors.attn,
          width: width,
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.totalAttn);
          },
          cardTitle: "Attendance",
          cardValue: "${state.attnP!.toStringAsFixed(2)}%",
          textColor: Colors.white,
        );
      }
    );
  }
}

class GradesCard extends StatelessWidget {
  final double width;

  const GradesCard({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
        if (state.cgpa == null) {
          return const MenuCardShimmer();
        }
        return MenuCard(
          cardColor: AppColors.grades,
          width: width,
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.totalGrades);
          },
          cardTitle: "Grades",
          cardValue: "${state.cgpa!.toStringAsFixed(2)}%",
          textColor: Colors.white,
        );
      }
    );
  }
}

class MenuCard extends StatelessWidget {
  final String cardTitle;
  final String? cardValue;
  final Color? textColor;
  final Color? cardColor;
  final double width;
  final void Function()? onTap;

  const MenuCard({
    super.key,
    required this.cardTitle,
    this.cardValue,
    required this.width,
    this.onTap,
    this.textColor,
    this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return GenericCard(
      color: cardColor,
      width: width,
      onTap: onTap,
      stackChildren: <Widget>[
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            cardTitle,
            style: TextStyle(
              fontSize: 14,
              color: textColor,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Text(
            cardValue ?? "",
            style: TextStyle(
              fontSize: 22,
              color: textColor,
            ),
          ),
        ),
      ],
    );
  }
}

class GenericCard extends StatelessWidget {
  final List<Widget> stackChildren;
  final void Function()? onTap;
  final double width;
  final Color? color;

  const GenericCard({
    super.key,
    required this.stackChildren,
    required this.onTap,
    required this.width,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CCard(
      color: color,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.all(Radius.circular(AppDimens.cardRadius)),
        child: SizedBox(
          width: width,
          height: AppDimens.cardHeight,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 18, 12),
            child: Stack(
              children: stackChildren,
            ),
          ),
        ),
      ),
    );
  }
}
