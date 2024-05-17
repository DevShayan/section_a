class UserAttendance {
  static List<Attn> subjAttnList = [];

  static double totalPercent = 0.0;
  static int totalPresents = 0;
  static int totalAbsents = 0;
  static int totalClasses = 0;


  static void updateData() {
    totalPresents = 0;
    totalAbsents = 0;
    totalClasses = 0;

    for (Attn attn in subjAttnList) {
      totalPresents += attn.presents.length;
      totalAbsents += attn.absents.length;
      totalClasses += attn.classes;
    }

    totalPercent = (totalPresents/totalClasses)*100;
  }
}


class Attn {
  String subjName;
  int classes;
  List<DateTime> presents;
  List<DateTime> absents;
  double percentage;

  Attn(this.subjName, this.classes, this.presents, this.absents, this.percentage);
}