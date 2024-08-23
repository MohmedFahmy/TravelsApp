import 'package:flutter/material.dart';

enum seasons {
  Winter,
  Spring,
  Summer,
  Autum,
}

enum TripType {
  Exploration,
  Recavery,
  Activites,
  Therapy,
}

class Trip {
  @required
  final String id;
  @required
  final List<String> categories;
  @required
  final String title;
  @required
  final TripType tripType;
  @required
  final seasons season;
  @required
  final String imageUrl;
  @required
  final int duration;
  @required
  final List<String> activities;
  @required
  final List<String> program;

  @required
  final bool isInSummer;
  @required
  final bool isInWinter;
  @required
  final bool isForFamilies;

  const Trip(
      {required this.id,
      required this.categories,
      required this.title,
      required this.tripType,
      required this.season,
      required this.imageUrl,
      required this.duration,
      required this.activities,
      required this.program,
      required this.isInSummer,
      required this.isInWinter,
      required this.isForFamilies});
}
