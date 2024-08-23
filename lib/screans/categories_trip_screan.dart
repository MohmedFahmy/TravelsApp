import 'package:flutter/material.dart';
import '../app_data.dart';
import '../widget/categories_item.dart';
import '../models/trips.dart';
import '../app_data.dart';
import '../widget/trips_items.dart';
import 'package:travels_app/app_data.dart';

class CategoriesTripScreen extends StatelessWidget {
  //const CategoriesTripScrean({super.key})
  // final String CategoriesId;
  // final String CategoriesTitel;
  // CategoriesTripScreen(this.CategoriesId, this.CategoriesTitel);

  @override
  Widget build(BuildContext context) {
    final routeArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final categoriesId = routeArgument['id'];
    final categoriestitel = routeArgument['titel'];

    final filterTrips = Trips_data.where((Trip) {
      return Trip.categories.contains(categoriesId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoriestitel!, textAlign: TextAlign.center),
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return TripsItems(
                id: filterTrips[index].id,
                title: filterTrips[index].title,
                imageUrl: filterTrips[index].imageUrl,
                duration: filterTrips[index].duration,
                tripType: filterTrips[index].tripType,
                season: filterTrips[index].season);
          },
          itemCount: filterTrips.length,
        ));
  }
}
