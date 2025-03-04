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
  final String id;
  final String landingDate;
  final bool successStatus;

  const LaunchesDataModel(
      {this.launchID,
      required this.flightNumber,
      required this.videoSource,
      required this.articleSoruce,
      required this.wikipediaSource,
      required this.missionName,
      required this.id,
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
        id: json['rocket'] ?? '',
        landingDate: json['date_utc'] ?? '',
        successStatus: json['success'] ?? false);
  }

  factory LaunchesDataModel.fromDBMap(Map<String, dynamic> map) {
    return LaunchesDataModel(

        flightNumber: map['flightNumber'],
        videoSource: map['videoSource'],
        articleSoruce: map['articleSoruce'],
        wikipediaSource: map['wikipediaSource'],
        missionName: map['missionName'],
        id: map['id'],
        landingDate: map['landingDate'],
        successStatus: map['successStatus'] == 1 );
  }
  Map<String, dynamic> toDBMap() {
    return {
      //? not giving launchID as its set to AUTOINCREMENT and can be passed as null - 
      'flightNumber' : flightNumber,
      'videoSource' : videoSource,
      'articleSoruce': articleSoruce,
      'wikipediaSource': wikipediaSource,
      'missionName': missionName,
      'id': id,
      'landingDate': landingDate,
      'successStatus' : successStatus ? 1: 0
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'flight_number': flightNumber,
      'webcast': videoSource,
      'article': articleSoruce,
      'wikipedia': wikipediaSource,
      'name': missionName,
      'rocket': id,
      'date_utc': landingDate,
      'success': successStatus
    };
  }
}
