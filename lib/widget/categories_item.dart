import 'package:flutter/material.dart';
import '../screans/categories_trip_screan.dart';

class CategoriesItem extends StatelessWidget {
  final String id;
  final String titel;
  final String imageurl;
  CategoriesItem(this.id, this.titel, this.imageurl);
  void SelectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      '/categories_trips',
      arguments: {
        'id': id,
        'titel': titel,
      },
    );
  }

  // const CategoriesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageurl,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              titel,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15)),
          )
        ],
      ),
    );
  }
}
