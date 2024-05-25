import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:section_a/constants/dimens.dart';
import 'package:section_a/pojos/schedule.dart';

class ScheduleScreen extends StatelessWidget {

  final List<Schedule> list = [
    Schedule(DateTime(2024, 5, 25, 8, 30), "OS"),
    Schedule(DateTime(2024, 5, 25, 10, 00), "OS"),
    Schedule(DateTime(2024, 5, 25, 11, 30), "OS"),
  ];

  ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Schedule"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:  AppDimens.horizScreenSpacing),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget> [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 40, 0, 10),
                child: Text(
                  DateFormat("EEE, MMM dd").format(DateTime.now()),
                  style: TextStyle(
                    fontSize: AppDimens.heading3Size,
                  ),
                ),
              ),

              ListView.builder(
                itemBuilder: (context, index) => Stack(
                  children: <Widget> [
                    Text(list[index].time.hour.toString()),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}