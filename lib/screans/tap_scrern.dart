import 'package:flutter/material.dart';
import '../screans/categories_screan.dart';
import '../screans/favorit_screan.dart';

class TapScrern extends StatelessWidget {
  const TapScrern({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Travels'),
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.dashboard),
              text: 'Categories',
            ),
            Tab(
              icon: Icon(Icons.star),
              text: 'Favorites',
            ),
          ]),
        ),
        body: TabBarView(children: [
          CategoriesScrean(),
          FavoritScrean(
            favoritsTraps: [],
          ),
        ]),
      ),
    );
  }
}
