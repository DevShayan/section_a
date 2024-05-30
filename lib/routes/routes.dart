import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:section_a/bloc/attndance/attn_bloc.dart';
import 'package:section_a/bloc/grades/grades_bloc.dart';
import 'package:section_a/bloc/home/home_bloc.dart';
import 'package:section_a/bloc/login/login_bloc.dart';
import 'package:section_a/bloc/schedule/sch_bloc.dart';
import 'package:section_a/screens/assignment.dart';
import 'package:section_a/screens/schedule.dart';
import 'package:section_a/screens/sem_grades.dart';
import 'package:section_a/screens/subj_attn.dart';
import 'package:section_a/screens/total_attn.dart';
import 'package:section_a/screens/home.dart';
import 'package:section_a/screens/login.dart';
import 'package:section_a/screens/total_grades.dart';

class AppRoutes {

  static const String home = "/home";
  static const String login = "/login";
  static const String totalAttn = "/total-attn";
  static const String subjAttn = "/subj-attn";
  static const String totalGrades = "/total-grades";
  static const String semGrades = "/sem-grades";
  static const String assignment = "/assignment";
  static const String schedule = "/schedule";


  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {

      case home:
        return MaterialPageRoute(builder: (context) => BlocProvider<HomeScreenBloc>(
          create: (context) => HomeScreenBloc(),
          child: const HomeScreen(),
        ));

      case login:
        return MaterialPageRoute(builder: (context) => BlocProvider<LoginScreenBloc>(
          create: (context) => LoginScreenBloc(),
          child: const LoginScreen(),
        ));

      case totalAttn:
        return MaterialPageRoute(builder: (context) => BlocProvider<AttndanceScreenBloc>(
          create: (context) => AttndanceScreenBloc(),
          child: const TotalAttnScreen(),
        ));

      case subjAttn:
        return MaterialPageRoute(builder: (context) => SubjAttnScreen(subjIndex: routeSettings.arguments as int));

      case totalGrades:
        return MaterialPageRoute(builder: (context) => BlocProvider<GradesBloc>(
          create: (context) => GradesBloc(),
          child: const TotalGradesScreen(),
        ));

      case semGrades:
        return MaterialPageRoute(builder: (context) => SemGradesScreen(semIndex: routeSettings.arguments as int));

      case assignment:
        return MaterialPageRoute(builder: (context) => AssignmentScreen(index: routeSettings.arguments as int));

      case schedule:
        return MaterialPageRoute(builder: (context) => BlocProvider<ScheduleBloc>(
          create: (context) => ScheduleBloc(),
          child: const ScheduleScreen(),
        ));

      default:
        return null;
    }
  }
}