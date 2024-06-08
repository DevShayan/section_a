import 'dart:math';
import 'package:section_a/constants/functions.dart';
import 'package:section_a/pojos/attn.dart';
import 'package:section_a/pojos/grades.dart';

class DummyAPI {

  static List<String> subjects = [
    "DCCN",
    "OS",
    "ISE",
    "DM",
    "Calc. 2",
  ];

  static List<DateTime> absents = [
    DateTime.now().subtract(const Duration(days: 2)),
    DateTime.now().subtract(const Duration(days: 4)),
    DateTime.now().subtract(const Duration(days: 6)),
  ];

  static List<DateTime> presents = [
    DateTime.now().subtract(const Duration(days: 1)),
    DateTime.now().subtract(const Duration(days: 3)),
    DateTime.now().subtract(const Duration(days: 5)),
    DateTime.now().subtract(const Duration(days: 7)),
    DateTime.now().subtract(const Duration(days: 9)),
    DateTime.now().subtract(const Duration(days: 11)),
    DateTime.now().subtract(const Duration(days: 13)),
  ];


  static Random random = Random();


  static bool fetchTotalAttnInUserAttndance() {

    for (int x = 0; x < 5; x++) {

      UserAttendance.subjAttnList.add(Attn(
        subjects[random.nextInt(5)],
        10,
        presents,
        absents,
        random.nextInt(101).toDouble(),
      ));
    }

    UserAttendance.updateData();

    return true;
    
  }


  static bool fetchTotalGradesInUserGrades() {

    fetchPosInUserGrades();
    fetchCGPAInUserGrades();

    List<SubjGrade> subjList = [];

    for (int x = 0; x < 8; x++) {
      for (int y = 0; y < 5; y++) {
        subjList.add(SubjGrade(
          subjects[random.nextInt(5)],
          random.nextInt(101).toDouble(),
          3.5,
          8,
        ));
      }
      UserGrades.gradesList.add(SemGrade(
        "Semester ${x+1}",
        subjList,
        2.5 + random.nextDouble() * (4.0 - 2.5),
        40.0 + random.nextDouble() * (99.9 - 40.0),
        100,
        0,
        8
      ));
      subjList = [];
    }

    return true;
    
  }


  static bool fetchPosInUserGrades() {
    UserGrades.position = 1 + random.nextInt(52).toDouble();

    return true;
    
  }

  static bool fetchCGPAInUserGrades() {
    UserGrades.cgpa = 2.5 + random.nextDouble() * (4.0 - 2.5);

    return true;
  }

}
