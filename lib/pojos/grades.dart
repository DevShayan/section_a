class UserGrades {
  static List<SemGrade> gradesList = [];

  static double position = 0.0;
  static double cgpa = 0.0;
  static double qGrades = 0.0;
  static double percentage = 0.0;
  static int cHrs = 0;


  static void updateData() {
    qGrades = 0.0;
    cHrs = 0;

    double totalMarks = 0.0;
    double obtainedMarks = 0.0;

    for (SemGrade semGrade in gradesList) {
      qGrades += semGrade.qGrades;
      cHrs += semGrade.semCHrs;

      totalMarks += semGrade.subjGradesList.length * 100;
      obtainedMarks += semGrade.obtainedMarks;
    }

    cgpa = qGrades/cHrs;
    percentage = (obtainedMarks/totalMarks)*100;
  }
}


class SemGrade {
  List<SubjGrade> subjGradesList = [];

  String semName;
  double gpa;
  double percentage;
  int totalMarks = 0;
  int obtainedMarks;
  double qGrades;
  int semCHrs;

  SemGrade(this.semName, this.subjGradesList, this.gpa, this.percentage, this.obtainedMarks, this.qGrades, this.semCHrs) {
    totalMarks = (subjGradesList.length)*100;
  }
}


class SubjGrade {
  String subjName;
  double totalMarks = 100;
  double obtainedMarks;
  double grade;
  int cHrs;

  SubjGrade(this.subjName, this.obtainedMarks, this.grade, this.cHrs);
}


