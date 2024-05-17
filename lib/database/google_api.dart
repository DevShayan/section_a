import 'dart:convert';
import 'package:http/http.dart';
import 'package:section_a/constants/functions.dart';
import 'package:section_a/pojos/assignments.dart';
import 'package:section_a/pojos/attn.dart';
import 'package:section_a/pojos/curr_user.dart';
import 'package:section_a/pojos/grades.dart';

class GoogleAPI {
  static const String _gradesURL = "https://script.google.com/macros/s/AKfycbzDpe7bXwvrnmf61sC16WXUMC85uSKWXTyQp1YG1Has2XY_Yp8ExB-WmhzUyh_qU4zdlA/exec";

  static bool gradesFuncLock = false;
  static bool attnFuncLock = false;



  static Future<bool> login(String misId) async {
    Response response = await get(Uri.parse("$_gradesURL?login=$misId"));
    dynamic data = await json.decode(response.body);

    if (data["error"] != null) {
      return false;
    }

    CurrUser.uid = data["data"]["uid"];
    CurrUser.name = data["data"]["username"];

    return true;
  }


  static Future<int> fetchTotalAttnInUserAttndance(int uid) async {
    attnFuncLock = true;
    Response response = await get(Uri.parse("$_gradesURL?get_attn_of_user=$uid"));
    dynamic data = await json.decode(response.body);

    for (var item in data["data"].entries) {

      UserAttendance.subjAttnList.add(Attn(
        item.key,
        item.value["classes"],
        item.value["attnPs"].map<DateTime>((value) => DateTime.parse(value)).toList(),
        item.value["attnAs"].map<DateTime>((value) => DateTime.parse(value)).toList(),
        item.value["attnPercent"].toDouble(),
      ));
    }

    UserAttendance.updateData();
    attnFuncLock = false;

    return 0;
    
  }


  static Future<int> fetchTotalGradesInUserGrades(int uid) async {
    gradesFuncLock = true;

    Response response = await get(Uri.parse("$_gradesURL?get_grades_of_user=$uid"));
    dynamic data = await json.decode(response.body);

    await fetchPosInUserGrades(CurrUser.name);
    await fetchCGPAInUserGrades(CurrUser.uid);


    List<SubjGrade> subjList = [];
    int semCrHrs = 0;

    for (var item in data["data"].entries) {
      if (item.value != null) {
        for (var subj in item.value["subjects"]) {
          subjList.add(SubjGrade(subj["subjName"], subj["marks"].toDouble(), subj["grade"].toDouble(), subj["cHrs"]));
          semCrHrs += subj["cHrs"] as int;
        }
        UserGrades.gradesList.add(SemGrade(item.key, subjList, item.value["gpa"], item.value["percentage"], item.value["totalMarks"], item.value["qGrades"].toDouble(), semCrHrs));
        subjList = [];
        semCrHrs = 0;
      }
    }

    UserGrades.updateData();
    gradesFuncLock = false;

    return 0;
    
  }


  static Future<bool> fetchPosInUserGrades(String username) async {
    Response response = await get(Uri.parse("$_gradesURL?get_pos_of=$username"));

    dynamic data = await json.decode(response.body);

    UserGrades.position = data["data"]["position"].toDouble();

    return true;
    
  }

  static Future<bool> fetchCGPAInUserGrades(int uid) async {
    Response response = await get(Uri.parse("$_gradesURL?get_cgpa_of=$uid"));

    dynamic data = await json.decode(response.body);

    UserGrades.cgpa = data["data"]["cgpa"];

    return true;
    
  }

  static Future<bool> fetchAssignIntoAssignments() async {
    Response response = await get(Uri.parse("$_gradesURL?get_assignments=true"));

    dynamic data = await json.decode(response.body);

    Assignments.assignmentsList = [];


    for (dynamic item in data["data"]) {
      Assignments.assignmentsList.add(Assignment(
        item["title"],
        item["body"],
        DateTime.parse(item["dueDate"]),
        DateTime.parse(item["assDate"])
      ));
    }

    return true;
    
  }

}


// API Parameters:

// login=[mis] - returns uid

// get_attn_of_subj=[1-5] & get_attn_of_user=[uid]
// get_attn_of_subj=[1-5]
// get_attn_of_user=[uid]
// get_all_attn=[any]
// get_total_attn_info_of=[uid]

// get_grades_of_sem=[1-8] & get_grades_of_user[uid]
// get_grades_of_sem=[1-8]
// get_grades_of_user[uid]
// get_all_grades=[any]
// get_cgpa_of=[uid]
// get_pos_of=[username]
// get_assignments=[any]
