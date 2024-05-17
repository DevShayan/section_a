import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:section_a/constants/colors.dart';
import 'package:section_a/constants/functions.dart';
import 'package:section_a/pojos/grades.dart';
import 'package:section_a/screens/total_attn.dart';
import 'package:section_a/ui_widgets/c_card.dart';

class SemGradesScreen extends StatelessWidget {
  final int semIndex;

  const SemGradesScreen({
    super.key,
    required this.semIndex,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    setCardWidth(screenWidth);


    return Scaffold(
      appBar: AppBar(
        title: Text(UserGrades.gradesList[semIndex].semName),
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
                      percent: (UserGrades.gradesList[semIndex].gpa/4.00)*100.0,
                      centerText: "${UserGrades.gradesList[semIndex].gpa.toStringAsFixed(2)}%",
                      footerText: "GPA",
                    ),
                    const SizedBox(height: 10),
                            
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        CPercentProgress(
                          size: (screenWidth < 620) ? screenWidth/10 : 62,
                          percent: UserGrades.gradesList[semIndex].percentage,
                          centerText: UserGrades.gradesList[semIndex].obtainedMarks.toString(),
                          footerText: "out of ${UserGrades.gradesList[semIndex].totalMarks}",
                        ),
                            
                        CPercentProgress(
                          size: (screenWidth < 620) ? screenWidth/10 : 62,
                          percent: UserGrades.gradesList[semIndex].percentage,
                          centerText: "${UserGrades.gradesList[semIndex].percentage.toStringAsFixed(2)}%",
                          footerText: "Percentage",
                        ),
                            
                        CPercentProgress(
                          size: (screenWidth < 620) ? screenWidth/10 : 62,
                          percent: 100,
                          centerText: UserGrades.gradesList[semIndex].semCHrs.toString(),
                          footerText: "Credit Hours",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
              
            const AttnHeading(title: "Marks"),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CCard(
                child: SizedBox(
                  width: double.infinity,
                  child: DataTable(
                    columns: const <DataColumn> [
                      DataColumn(label: Text("Subject")),
                      DataColumn(label: Text("CH")),
                      DataColumn(label: Text("Marks")),
                    ],
                    rows: UserGrades.gradesList[semIndex].subjGradesList.map((e) => DataRow(
                      cells: <DataCell> [
                        DataCell(Text(e.subjName)),
                        DataCell(Text(e.cHrs.toString())),
                        DataCell(Text(e.obtainedMarks.toString())),
                      ]
                    )).toList()
                  ),
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
        progressColor: AppColors.grades,
      ),
    );
  }
}


