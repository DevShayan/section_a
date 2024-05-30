import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:section_a/bloc/schedule/sch_bloc.dart';
import 'package:section_a/bloc/schedule/sch_state.dart';
import 'package:section_a/constants/dimens.dart';
import 'package:section_a/pojos/schedule.dart';
import 'package:section_a/ui_widgets/c_card.dart';

class ScheduleScreen extends StatelessWidget {

  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ScheduleBloc>(context).updateCurrIndex();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Schedule"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:  AppDimens.horizScreenSpacing),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 0, 10),
                child: Text(
                  DateFormat("EEE, MMM dd").format(DateTime.now()),
                  style: TextStyle(
                    fontSize: AppDimens.heading3Size,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              ListView.builder(
                itemCount: Schedules.list[DateTime.now().weekday-1].length,
                shrinkWrap: true,
                itemBuilder: (context, index) => BlocBuilder<ScheduleBloc, ScheduleState>(
                  builder: (context, state) {
                    return CCard(
                      unElevated: index != state.currIndex,
                      color: (index == state.currIndex) ? null : Theme.of(context).colorScheme.surface,
                      child: Padding(
                        padding: (index == state.currIndex) ?
                          const EdgeInsets.fromLTRB(14, 14, 14, 14) :
                          const EdgeInsets.fromLTRB(14, 3, 14, 2),
                        child: Stack(
                          children: <Widget> [
                            Text("${Schedules.list[DateTime.now().weekday-1][index].startTime.hour}:${Schedules.list[DateTime.now().weekday-1][index].startTime.minute.toString().padLeft(2, "0")}"),
                        
                            (index == state.currIndex) ?
                            Align(
                              alignment: Alignment.center,
                              child: Text(BlocProvider.of<ScheduleBloc>(context).durationToString())
                            ) :
                            const SizedBox(),

                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(Schedules.list[DateTime.now().weekday-1][index].subject),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}