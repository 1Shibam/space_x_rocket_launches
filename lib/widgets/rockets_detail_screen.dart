import 'package:flutter/material.dart';

class RocketsDetailScreen extends StatelessWidget {
  const RocketsDetailScreen(
      {super.key,
      required this.rocketName,
      required this.activeStatus,
      required this.costPerLaunch,
      required this.successRate,
      required this.firstLauch,
      required this.country,
      required this.wikipediaSource,
      required this.description,
      required this.heightInMeters,
      required this.heightInFeet,
      required this.diameterInMeter,
      required this.diameterInFeet,
      required this.massInKg,
      required this.massInLbs});
  final String rocketName;
  final bool activeStatus;
  final int costPerLaunch;
  final int successRate;
  final String firstLauch;
  final String country;
  final String wikipediaSource;
  final String description;
  final double heightInMeters;
  final double heightInFeet;
  final double diameterInMeter;
  final double diameterInFeet;
  final double massInKg;
  final double massInLbs;

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

/*
  final int? rocketID;
  final String rocketName;
  final bool activeStatus;
  final int costPerLaunch;
  final int successRate;
  final String firstLaunch;
  final String country;
  final String wikipediaSource;
  final String description;
  final String rocket;

  final double heightInMeters;
  final double heightInFeets;
  final double diameterInMeter;
  final double diameterInFeets;
  final double massInKg;
  final double massInLbs;
 */