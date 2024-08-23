import 'package:flutter/material.dart';
import 'package:travels_app/app_data.dart';
import 'package:travels_app/screans/categories_screan.dart';
import 'package:travels_app/screans/categories_trip_screan.dart';
import 'package:travels_app/screans/filter_screan.dart';
import 'package:travels_app/screans/tap_scrern.dart';
import '../screans/trips_detels_screan.dart';
import './screans/categories_trip_screan.dart';
import './screans/tab_screan.dart';
import './models/trips.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Trip> favoritsTrip = [];

  void managFavoritTrips(String tripId) {
    final exestingTrip = favoritsTrip.indexWhere((Trip) => Trip.id == tripId);
    if (exestingTrip >= 0) {
      setState(() {
        favoritsTrip.removeAt(exestingTrip);
      });
    } else {
      setState(() {
        favoritsTrip.add(Trips_data.firstWhere((Trip) => Trip.id == tripId));
      });
    }
  }

  bool _isInFav(String id) {
    return favoritsTrip.any((Trip) => Trip.id == int);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Travels app',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        //home: TabScrean(),
        initialRoute: '/',
        routes: {
          '/': (ctx) => TabScrean(
                favoritsTraps: [],
              ),
          ('/categories_trips'): (ctx) => CategoriesTripScreen(),
          TripsDetelsScrean.screanRoute: (ctx) =>
              TripsDetelsScrean(managFavoritTrips, _isInFav),
          '/filter': (ctx) => FilterScrean(),
        });
  }
}
