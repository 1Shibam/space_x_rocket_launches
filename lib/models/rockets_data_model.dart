import 'package:meta/meta.dart';

// rockets data model
@immutable
class RocketsDataModel {
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

  const RocketsDataModel(
      {this.rocketID,
      required this.rocket,
      required this.rocketName,
      required this.activeStatus,
      required this.costPerLaunch,
      required this.successRate,
      required this.firstLaunch,
      required this.country,
      required this.wikipediaSource,
      required this.description,
      required this.heightInMeters,
      required this.heightInFeets,
      required this.diameterInMeter,
      required this.diameterInFeets,
      required this.massInKg,
      required this.massInLbs});

  factory RocketsDataModel.fromJson(Map<String, dynamic> json) {
    // may get null values --
    return RocketsDataModel(
        rocket: json['id'] ?? '',
        rocketName: json['name'] ?? '',
        activeStatus: json['active'] ?? false,
        costPerLaunch: json['cost_per_launch'] ?? 0,
        successRate: json['success_rate_pct'] ?? 0,
        firstLaunch: json['first_flight'] ?? '',
        country: json['country'] ?? '',
        wikipediaSource: json['wikipedia'] ?? '',
        description: json['description'] ?? '',
        heightInMeters: (json['height']['meters'] as num?)?.toDouble() ?? 0,
        heightInFeets: (json['height']['feet'] as num?)?.toDouble() ?? 0,
        diameterInMeter: (json['diameter']['meters'] as num?)?.toDouble() ?? 0,
        diameterInFeets: (json['diameter']['feet'] as num?)?.toDouble() ?? 0,
        massInKg: (json['mass']['kg'] as num?)?.toDouble() ?? 0,
        massInLbs: (json['mass']['lb'] as num?)?.toDouble() ?? 0);
  }

  factory RocketsDataModel.fromDataBaseMap(Map<String, dynamic> map) {
    return RocketsDataModel(
        rocketID: map['rocketID'] as int?,
        rocket: map['rocket'],
        rocketName: map['rocketName'],
        activeStatus: map['activeStatus'],
        costPerLaunch: map['costPerLaunch'],
        successRate: map['successRate'],
        firstLaunch: map['firstLaunch'],
        country: map['country'],
        wikipediaSource: map['wikipediaSource'],
        description: map['description'],
        heightInMeters: map['heightInMeters'],
        heightInFeets: map['heightInFeets'],
        diameterInMeter: map['diameterInMeter'],
        diameterInFeets: map['diameterInFeets'],
        massInKg: map['massInKg'],
        massInLbs: map['massInLbs']);
  }
  Map<String, dynamic> toJson() {
    return {
      'name': rocketName,
      'active': activeStatus,
      'cost_per_launch': costPerLaunch,
      'success_rate_pct': successRate,
      'first_flight': firstLaunch,
      'country': country,
      'wikipedia': wikipediaSource,
      'description': description,
      'height': {'meters': heightInMeters, 'feet': heightInFeets},
      'diameter': {'meters': diameterInMeter, 'feet': diameterInFeets},
      'mass': {'kg': massInKg, 'lb': massInLbs}
    };
  }
}
