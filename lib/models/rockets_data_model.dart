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
        heightInMeters: (json['height']['meters'] as num?)?.toDouble() ?? 0.0,
        heightInFeets: (json['height']['feet'] as num?)?.toDouble() ?? 0.0,
        diameterInMeter:
            (json['diameter']['meters'] as num?)?.toDouble() ?? 0.0,
        diameterInFeets: (json['diameter']['feet'] as num?)?.toDouble() ?? 0.0,
        massInKg: (json['mass']['kg'] as num?)?.toDouble() ?? 0.0,
        massInLbs: (json['mass']['lb'] as num?)?.toDouble() ?? 0.0);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
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

  //From DB method -
  factory RocketsDataModel.fromDBMap(Map<String, dynamic> map) {
    return RocketsDataModel(
        rocketID: map['rocketID'] as int?,
        id: map['id'] ?? '',
        rocketName: map['rocketName'] ?? '',
        activeStatus: map['activeStatus'] == 1,
        costPerLaunch: map['costPerLaunch'] ?? '',
        successRate: map['successRate'] ?? 0,
        firstLaunch: map['firstLaunch'] ?? '',
        country: map['country'] ?? '',
        wikipediaSource: map['wikipediaSource'] ?? '',
        description: map['description'] ?? 0,
        heightInMeters: map['heightInMeters'] ?? 0.0,
        heightInFeets: map['heightInFeets'] ?? 0.0,
        diameterInMeter: map['diameterInMeter'] ?? 0.0,
        diameterInFeets: map['diameterInFeets'] ?? 0.0,
        massInKg: map['massInKg'] ?? 0.0,
        massInLbs: map['massInLbs'] ?? 0.0);
  }

  //to db map method -
  Map<String, dynamic> toDBMap() {
    return {
      'id': id,
      'rocketName': rocketName,
      'activeStatus': activeStatus ? 1 : 0,
      'costPerLaunch': costPerLaunch,
      'successRate': successRate,
      'firstLaunch': firstLaunch,
      'country': country,
      'wikipediaSource': wikipediaSource,
      'description': description,
      'heightInMeters': heightInMeters,
      'heightInFeets': heightInFeets,
      'diameterInMeter': diameterInMeter,
      'diameterInFeets': diameterInFeets,
      'massInKg': massInKg,
      'massInLbs': massInLbs
    };
  }
}
