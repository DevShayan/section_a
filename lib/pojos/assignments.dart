class Assignments {
  static List<Assignment> assignmentsList = [];
}

class Assignment {
  String title;
  String body;
  DateTime dueDate;
  DateTime assignedDate;

  Assignment(this.title, this.body, this.dueDate, this.assignedDate) {
    if (body == "") {
      body = "-";
    }
  }
}