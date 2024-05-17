import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:section_a/bloc/grades/grades_bloc.dart';
import 'package:section_a/constants/colors.dart';
import 'package:section_a/constants/dimens.dart';
import 'package:section_a/constants/functions.dart';
import 'package:section_a/pojos/grades.dart';
import 'package:section_a/screens/home.dart';
import 'package:section_a/ui_widgets/c_card.dart';

class TotalGradesScreen extends StatelessWidget {
  const TotalGradesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    setCardWidth(screenWidth);


    return Scaffold(
      appBar: AppBar(
        title: const Text("Grades"),
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
                      percent: (UserGrades.cgpa/4.00)*100.0,
                      centerText: UserGrades.cgpa.toStringAsFixed(2),
                      footerText: "CGPA",
                    ),
                    const SizedBox(height: 10),
                            
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        CPercentProgress(
                          size: (screenWidth < 620) ? screenWidth/10 : 62,
                          percent: (1 - ((UserGrades.position-1)/56))*100,
                          centerText: UserGrades.position.toString(),
                          footerText: "Position",
                        ),
                            
                        CPercentProgress(
                          size: (screenWidth < 620) ? screenWidth/10 : 62,
                          percent: UserGrades.percentage,
                          centerText: "${UserGrades.percentage.toStringAsFixed(2)}%",
                          footerText: "Percentage",
                        ),
                            
                        CPercentProgress(
                          size: (screenWidth < 620) ? screenWidth/10 : 62,
                          percent: (UserGrades.cHrs/128)*100,
                          centerText: UserGrades.cHrs.toString(),
                          footerText: "Credit Hours",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
              
            const AttnHeading(title: "Semesters"),
        
            Wrap(
              children: List.generate(
                UserGrades.gradesList.length,
                (index) => MenuCard(
                  onTap: () => BlocProvider.of<GradesBloc>(context).onTapSemCard(context, index),
                  cardTitle: UserGrades.gradesList[index].semName,
                  cardValue: UserGrades.gradesList[index].gpa.toStringAsFixed(2),
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
        percent: (percent > 100 || percent < 0) ? 0 : percent/100,
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
        progressColor: AppColors.grades,
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

