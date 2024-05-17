import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:section_a/bloc/attndance/attn_bloc.dart';
import 'package:section_a/constants/colors.dart';
import 'package:section_a/constants/dimens.dart';
import 'package:section_a/constants/functions.dart';
import 'package:section_a/pojos/attn.dart';
import 'package:section_a/screens/home.dart';
import 'package:section_a/ui_widgets/c_card.dart';

class TotalAttnScreen extends StatelessWidget {
  const TotalAttnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    setCardWidth(screenWidth);


    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendance"),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CCard(
                child: Column(
                  children: [
                    CPercentProgress(
                      size: (screenWidth < 620) ? screenWidth/6 : 103,
                      percent: UserAttendance.totalPercent,
                      centerText: "${UserAttendance.totalPercent.toStringAsFixed(2)}%",
                      footerText: "Total Attendance",
                    ),
                    const SizedBox(height: 10),
                            
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        CPercentProgress(
                          size: (screenWidth < 620) ? screenWidth/10 : 62,
                          percent: (UserAttendance.totalAbsents/UserAttendance.totalClasses)*100,
                          centerText: UserAttendance.totalAbsents.toString(),
                          footerText: "Absents",
                        ),
                            
                        CPercentProgress(
                          size: (screenWidth < 620) ? screenWidth/10 : 62,
                          percent: UserAttendance.totalPercent,
                          centerText: UserAttendance.totalPresents.toString(),
                          footerText: "Presents",
                        ),
                            
                        CPercentProgress(
                          size: (screenWidth < 620) ? screenWidth/10 : 62,
                          percent: 100,
                          centerText: UserAttendance.totalClasses.toString(),
                          footerText: "Classes",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
              
            const AttnHeading(title: "Subjects"),
        
            Wrap(
              children: List.generate(
                UserAttendance.subjAttnList.length,
                (index) => MenuCard(
                  onTap: () => BlocProvider.of<AttndanceScreenBloc>(context).onTapCard(context, index),
                  cardTitle: UserAttendance.subjAttnList[index].subjName,
                  cardValue: "${UserAttendance.subjAttnList[index].percentage.toStringAsFixed(0)}%",
                  width: AppDimens.cardWidth
                ),
              ),
            ),
        
            
          ],
        ),
      ),
    );
  }
}

class CPercentProgress extends StatelessWidget {
  final double percent;
  final String footerText;
  final String centerText;
  final double size;
  final Color? startColor;
  final Color? endColor;

  const CPercentProgress({
    super.key,
    required this.percent,
    required this.footerText,
    required this.centerText,
    required this.size,
    this.startColor,
    this.endColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CircularPercentIndicator(
        percent: percent/100,
        radius: size,
        lineWidth: (size*10)/60,
        center: Text(
            centerText,
            style: TextStyle(
              fontSize: (size*20)/60,
            ),
          ),
        footer: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(footerText),
        ),
        animation: true,
        animationDuration: 1000,
        circularStrokeCap: CircularStrokeCap.round,
        rotateLinearGradient: true,
        progressColor: AppColors.attn,
      ),
    );
  }
}

class AttnHeading extends StatelessWidget {
  final String title;

  const AttnHeading({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 0, 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

