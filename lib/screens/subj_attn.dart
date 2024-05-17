import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:section_a/constants/colors.dart';
import 'package:section_a/constants/functions.dart';
import 'package:section_a/pojos/attn.dart';
import 'package:section_a/screens/total_attn.dart';
import 'package:section_a/ui_widgets/c_card.dart';

class SubjAttnScreen extends StatelessWidget {
  final int subjIndex;

  const SubjAttnScreen({
    super.key,
    required this.subjIndex,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    setCardWidth(screenWidth);


    return Scaffold(
      appBar: AppBar(
        title: Text(UserAttendance.subjAttnList[subjIndex].subjName),
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
                      percent: UserAttendance.subjAttnList[subjIndex].percentage,
                      centerText: "${UserAttendance.subjAttnList[subjIndex].percentage.toStringAsFixed(2)}%",
                      footerText: "Attendance",
                    ),
                    const SizedBox(height: 10),
                            
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        CPercentProgress(
                          size: (screenWidth < 620) ? screenWidth/10 : 62,
                          percent: (UserAttendance.subjAttnList[subjIndex].absents.length/UserAttendance.subjAttnList[subjIndex].classes)*100,
                          centerText: UserAttendance.subjAttnList[subjIndex].absents.length.toString(),
                          footerText: "Absents",
                        ),
                            
                        CPercentProgress(
                          size: (screenWidth < 620) ? screenWidth/10 : 62,
                          percent: UserAttendance.subjAttnList[subjIndex].percentage,
                          centerText: UserAttendance.subjAttnList[subjIndex].presents.length.toString(),
                          footerText: "Presents",
                        ),
                            
                        CPercentProgress(
                          size: (screenWidth < 620) ? screenWidth/10 : 62,
                          percent: 100,
                          centerText: UserAttendance.subjAttnList[subjIndex].classes.toString(),
                          footerText: "Classes",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
              
            const AttnHeading(title: "Absents"),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CCard(
                child: Column(
                  children: List.generate(
                  UserAttendance.subjAttnList[subjIndex].absents.length,
                  (index) => ListTile(
                    title: Text("Class ${index+1}"),
                    trailing: Text(DateFormat("d MMM, yyyy").format(UserAttendance.subjAttnList[subjIndex].absents[index])),
                  ),
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
        progressColor: AppColors.attn,
      ),
    );
  }
}


