import 'package:flutter/material.dart';
import 'package:travels_app/screans/trips_detels_screan.dart';
import '../models/trips.dart';

class TripsItems extends StatelessWidget {
  //const TripsItems({super.key});
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final seasons season;
  const TripsItems(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.tripType,
      required this.season,
      required this.id});

  String get seasonText {
    if (season == seasons.Winter) {
      return ('Winter');
    }
    if (season == seasons.Spring) {
      return ('Spring');
    }
    if (season == seasons.Summer) {
      return ('Summer');
    }
    if (season == seasons.Autum) {
      return ('Autum');
    }
    return ('Unkown');
  }

  String get tripTypeText {
    if (tripType == TripType.Exploration) {
      return ('Exploration');
    }
    if (tripType == TripType.Activites) {
      return ('Activites');
    }
    if (tripType == TripType.Recavery) {
      return ('Recovery');
    }
    if (tripType == TripType.Therapy) {
      return ('Therapy');
    }
    return ('Unkown');
  }

  void selecttrip(BuildContext context) {
    Navigator.of(context)
        .pushNamed(TripsDetelsScrean.screanRoute, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selecttrip(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 7,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250,
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0.8)
                    ],
                    stops: [0.6, 1],
                  )),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromARGB(255, 255, 255, 255)),
                    overflow: TextOverflow.fade,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.today,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration days'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.wb_sunny,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(seasonText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.family_restroom,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(tripTypeText),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
