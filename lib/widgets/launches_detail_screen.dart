import 'package:flutter/material.dart';

class LaunchesDetailScreen extends StatelessWidget {
  const LaunchesDetailScreen(
      {super.key,
      required this.flightNumber,
      required this.videoSource,
      required this.articleSource,
      required this.wikipediaSource,
      required this.missionName,
      required this.rocket,
      required this.landinDate,
      required this.successStatus});
  final int flightNumber;
  final String videoSource;
  final String articleSource;
  final String wikipediaSource;
  final String missionName;
  final String rocket;
  final String landinDate;
  final bool successStatus;

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

/*
 final int? launchID;
  final int flightNumber;
  final String videoSource;
  final String articleSoruce;
  final String wikipediaSource;
  final String missionName;
  final String rocket;
  final String landingDate;
  final bool successStatus;
 */

//5e9d0d95eda69955f709d1eb
//5e9d0d95eda69955f709d1eb