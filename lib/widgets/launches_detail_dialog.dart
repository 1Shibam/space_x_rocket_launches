import 'package:flutter/material.dart';

class LaunchesDetailDialog extends StatelessWidget {
  const LaunchesDetailDialog(
      {super.key,
      required this.flightNumber,
      required this.rocketName,
      required this.videoSource,
      required this.articleSource,
      required this.wikipediaSource,
      required this.missionName,
      required this.rocket,
      required this.landinDate,
      required this.successStatus});
  final int flightNumber;
  final String rocketName;
  final String videoSource;
  final String articleSource;
  final String wikipediaSource;
  final String missionName;
  final String rocket;
  final String landinDate;
  final bool successStatus;

  @override
  Widget build(BuildContext context) {
    return const AlertDialog();
  }
}
