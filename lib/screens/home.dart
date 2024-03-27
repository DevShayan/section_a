import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:section_a/bloc/home/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeScreenBloc>(context).fetchData();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Section A"),
      ),

      body: const Align(
        alignment: Alignment.topCenter,
        child: Wrap(
          direction: Axis.horizontal,
          children: <Widget>[
            MenuCard(
              cardTitle: "Attendance",
              cardValue: "75%",
            ),
            MenuCard(
              cardTitle: "Grades",
              cardValue: "3.5",
            ),
            MenuCard(
              cardTitle: "Notes"
            ),
          ],
        ),
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final String cardTitle;
  final String? cardValue;

  const MenuCard({
    super.key,
    required this.cardTitle,
    this.cardValue,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        onTap: () {},
        child: SizedBox(
          width: 240,
          height: 140,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    cardTitle,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    cardValue ?? "",
                    style: const TextStyle(
                      fontSize: 26,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
