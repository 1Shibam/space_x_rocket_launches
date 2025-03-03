// !!Show basic launch information (mission name, date, rocket used, success status)

import 'package:meta/meta.dart';

//launches data model
@immutable
class LaunchesDataModel {
  final int? launchID;
  final int flightNumber;
  final String videoSource;
  final String articleSoruce;
  final String wikipediaSource;
  final String missionName;
  final String rocket;
  final String landingDate;
  final bool successStatus;

  const LaunchesDataModel(
      {this.launchID,
      required this.flightNumber,
      required this.videoSource,
      required this.articleSoruce,
      required this.wikipediaSource,
      required this.missionName,
      required this.rocket,
      required this.landingDate,
      required this.successStatus});

  factory LaunchesDataModel.fromJson(Map<String, dynamic> json) {
    //might get null values --
    return LaunchesDataModel(
        flightNumber: json['flight_number'] ?? 0,
        videoSource: json['links']['webcast'] ?? '',
        articleSoruce: json['links']['article'] ?? '',
        wikipediaSource: json['links']["wikipedia"] ?? '',
        missionName: json['name'] ?? '',
        rocket: json['rocket'] ?? '',
        landingDate: json['date_utc'] ?? '',
        successStatus: json['success'] ?? false);
  }

  factory LaunchesDataModel.fromDBMap(Map<String, dynamic> map) {
    return LaunchesDataModel(
        launchID: map['launchID'] as int?,
        flightNumber: map[''],
        videoSource: map[''],
        articleSoruce: map[''],
        wikipediaSource: map[''],
        missionName: map[''],
        rocket: map[''],
        landingDate: map[''],
        successStatus: map['']);
  }
  Map<String, dynamic> toJson() {
    return {
      'flight_number': flightNumber,
      'webcast': videoSource,
      'article': articleSoruce,
      'wikipedia': wikipediaSource,
      'name': missionName,
      'rocket': rocket,
      'date_utc': landingDate,
      'success': successStatus
    };
  }
}
