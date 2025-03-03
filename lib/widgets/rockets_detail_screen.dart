import 'package:flutter/material.dart';
import 'package:space_x_rocket_launches/models/rockets_data_model.dart';

class RocketsDetailScreen extends StatelessWidget {
  const RocketsDetailScreen({super.key, required this.rocketsDataModel});
  final RocketsDataModel rocketsDataModel;

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
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