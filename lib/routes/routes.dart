import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:section_a/bloc/home/home_bloc.dart';
import 'package:section_a/bloc/login/login_bloc.dart';
import 'package:section_a/screens/home.dart';
import 'package:section_a/screens/login.dart';

class AppRoutes {

  static const String home = "/home";
  static const String login = "/login";


  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {

      case home:
        return MaterialPageRoute(builder: (context) => BlocProvider<HomeScreenBloc>(
          create: (context) {
            return HomeScreenBloc();
          },
          child: const HomeScreen(),
        ));

      case login:
        return MaterialPageRoute(builder: (context) => BlocProvider<LoginScreenBloc>(
          create: (context) {
            return LoginScreenBloc();
          },
          child: const LoginScreen(),
        ));

      default:
        return null;
    }
  }
}