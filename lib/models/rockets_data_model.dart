import 'package:meta/meta.dart';

// rockets data model
@immutable
class RocketsDataModel {
  final int? rocketID;
  final String id;
  final String rocketName;
  final bool activeStatus;
  final int costPerLaunch;
  final int successRate;
  final String firstLaunch;
  final String country;
  final String wikipediaSource;
  final String description;
  final double heightInMeters;
  final double heightInFeets;
  final double diameterInMeter;
  final double diameterInFeets;
  final double massInKg;
  final double massInLbs;

  const RocketsDataModel(
      {this.rocketID,
      required this.id,
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
        id: json['id'] ?? '',
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
  Map<String, dynamic> toJson() {
    return {
      'id' : id,
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
