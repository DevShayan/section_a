import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:section_a/constants/dimens.dart';
import 'package:section_a/pojos/assignments.dart';

class AssignmentScreen extends StatelessWidget {
  final int index;

  const AssignmentScreen({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.horizScreenSpacing),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          const SizedBox(height: 20),

          Text(
            Assignments.assignmentsList[index].title,
            style: TextStyle(
              fontSize: AppDimens.heading2Size,
            ),
          ),
          const SizedBox(height: 20),
      
          Text(Assignments.assignmentsList[index].body),
          const SizedBox(height: 20),

          Align(
            alignment: Alignment.centerRight,
            child: Text("Deadline: ${DateFormat("dd MMM, yyyy").format(Assignments.assignmentsList[index].dueDate)}"),
          )
        ],
      ),
    );
  }
}