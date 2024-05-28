class Schedules {
  static List<Schedule> list = [];
}


class Schedule {
  DateTime startTime;
  DateTime endTime;
  String subject;
  String day;

  Schedule(this.startTime, this.endTime, this.day, this.subject);
}