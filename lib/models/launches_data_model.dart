// !!Show basic launch information (mission name, date, rocket used, success status)

import 'package:meta/meta.dart';

//launches data model
@immutable
class LaunchesDataModel {
  final int flightNumber;
  final String videoSource;
  final String articleSoruce;
  final String wikipediaSource;
  final String missionName;
  final String rocket;
  final String landingDate;
  final bool successStatus;

  const LaunchesDataModel(
      {required this.flightNumber,
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
        videoSource: json['webcast'] ?? '',
        articleSoruce: json['article'] ?? '',
        wikipediaSource: json["wikipedia"] ?? '',
        missionName: json['name'] ?? '',
        rocket: json['rocket'] ?? '',
        landingDate: json['date_utc'] ?? '',
        successStatus: json['success'] ?? '');
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
