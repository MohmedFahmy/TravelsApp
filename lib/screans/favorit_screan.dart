import 'package:flutter/material.dart';
import '../models/trips.dart';
import '../widget/trips_items.dart';

class FavoritScrean extends StatelessWidget {
  // const FavoritScrean({super.key});

  final List<Trip> favoritsTraps;

  const FavoritScrean({required this.favoritsTraps});

  @override
  Widget build(BuildContext context) {
    if (favoritsTraps.isEmpty) {
      return Center(
        child: Text('No Favorit Trips'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return TripsItems(
              id: favoritsTraps[index].id,
              title: favoritsTraps[index].title,
              imageUrl: favoritsTraps[index].imageUrl,
              duration: favoritsTraps[index].duration,
              tripType: favoritsTraps[index].tripType,
              season: favoritsTraps[index].season);
        },
        itemCount: favoritsTraps.length,
      );
    }
  }
}
