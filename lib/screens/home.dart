import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:section_a/bloc/home/home_bloc.dart';
import 'package:section_a/bloc/home/home_state.dart';
import 'package:section_a/constants/dimens.dart';
import 'package:section_a/constants/functions.dart';
import 'package:section_a/pojos/assignments.dart';
import 'package:section_a/pojos/curr_user.dart';
import 'package:section_a/routes/routes.dart';
import 'package:section_a/ui_widgets/c_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeScreenBloc>(context).fetchData();

    setCardWidth(MediaQuery.of(context).size.width);

    return Scaffold(
      appBar: AppBar(
        title: Text("Hello ${CurrUser.name}"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeading(title: "Upcoming Assignments"),
              SizedBox(
                height: 140,
                child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
                  builder: (context, state) {
                    if (!state.assignmentsFetched) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return ListView.builder(
                      itemCount: Assignments.assignmentsList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => MenuCard(
                        cardTitle: Assignments.assignmentsList[index].title,
                        width: AppDimens.cardWidth,
                        onTap: () {},
                      ),
                    );
                  },
                ),
              ),
              const HomeHeading(title: "Insights"),
              Wrap(
                direction: Axis.horizontal,
                children: <Widget>[
                  AttnCard(
                    width: AppDimens.cardWidth,
                  ),
                  GradesCard(
                    width: AppDimens.cardWidth,
                  ),
                  MenuCard(
                    cardTitle: "Notes",
                    width: AppDimens.cardWidth,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeHeading extends StatelessWidget {
  final String title;

  const HomeHeading({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 40, 0, 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

class AttnCard extends StatelessWidget {
  final double width;

  const AttnCard({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GenericCard(
      color: Colors.purple,
      width: width,
      onTap: () {
        if (BlocProvider.of<HomeScreenBloc>(context).state.attnP != null) {
          Navigator.pushNamed(context, AppRoutes.totalAttn);
        }
      },
      stackChildren: <Widget>[
        const Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "Attendance",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
            builder: (context, state) {
              if (state.attnP == null) {
                return const CircularProgressIndicator();
              }
              return Text(
                "${state.attnP!.toStringAsFixed(2)}%",
                style: const TextStyle(
                  fontSize: 22,
                color: Colors.white,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class GradesCard extends StatelessWidget {
  final double width;

  const GradesCard({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GenericCard(
      color: Colors.deepOrange,
      width: width,
      onTap: () {
        if (BlocProvider.of<HomeScreenBloc>(context).state.cgpa != null) {
          Navigator.pushNamed(context, AppRoutes.totalGrades);
        }
      },
      stackChildren: <Widget>[
        const Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "Grades",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
            builder: (context, state) {
              if (state.cgpa == null) {
                return const CircularProgressIndicator();
              }
              return Text(
                "${state.cgpa!.toStringAsFixed(2)}%",
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class MenuCard extends StatelessWidget {
  final String cardTitle;
  final String? cardValue;
  final double width;
  final void Function()? onTap;

  const MenuCard(
      {super.key,
      required this.cardTitle,
      this.cardValue,
      required this.width,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GenericCard(
      width: width,
      onTap: onTap,
      stackChildren: <Widget>[
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            cardTitle,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Text(
            cardValue ?? "",
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
        ),
      ],
    );
  }
}

class GenericCard extends StatelessWidget {
  final List<Widget> stackChildren;
  final void Function()? onTap;
  final double width;
  final Color? color;

  const GenericCard({
    super.key,
    required this.stackChildren,
    required this.onTap,
    required this.width,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CCard(
      color: color,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.all(Radius.circular(AppDimens.cardRadius)),
        child: SizedBox(
          width: width,
          height: 140,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 18, 12),
            child: Stack(
              children: stackChildren,
            ),
          ),
        ),
      ),
    );
  }
}
