import 'dart:convert';
import 'package:http/http.dart';
import 'package:section_a/constants/functions.dart';

class GoogleAPI {
  static const String _gradesURL = "https://script.google.com/macros/s/AKfycbyiCSCckrd6dx0nS5euffuZiAmcjKhLUkooJvdViysLY78l9Z3UJKjyhuC3DJ2LMqNL/exec";



  static Future<int> login(String misId) async {
    Response response = await get(Uri.parse("$_gradesURL?login=$misId"));
    dynamic data = await json.decode(response.body);

    if (data["data"].toString().contains("MIS")) {
      return 0;
    }

    return data["data"];
  }


  static Future<double> fetchAttnOfUser(String uid) async {
    Response response = await get(Uri.parse("$_gradesURL?get_attn_of_user=$uid"));

    dynamic data = await json.decode(response.body);

    return data["data"]["cgpa"];
  }
}


// API Parameters:

// login=[mis] - returns uid

// get_attn_of_subj=[1-5] & get_attn_of_user=[uid]
// get_attn_of_subj=[1-5]
// get_attn_of_user=[uid]
// get_all_attn=[mis]

// get_grades_of_sem=[1-8] & get_grades_of_user[uid]
// get_grades_of_sem=[1-8]
// get_grades_of_user[uid]
// get_all_grades=[mis]
