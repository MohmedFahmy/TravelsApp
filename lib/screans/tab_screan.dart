import 'package:flutter/material.dart';
import 'package:travels_app/widget/drawer.dart';
import '../screans/categories_screan.dart';
import '../screans/favorit_screan.dart';
import '../models/trips.dart';

class TabScrean extends StatefulWidget {
  //const TabScrean({super.key});
  final List<Trip> favoritsTraps;

  const TabScrean({required this.favoritsTraps});

  @override
  State<TabScrean> createState() => _TabScreanState();
}

class _TabScreanState extends State<TabScrean> {
  void _selectPages(int index) {
    setState(() {
      _selectedScreanIndex = index;
    });
  }

  int _selectedScreanIndex = 0;

  List<Map<String, Object>> _screans = [];

  @override
  void initState() {
    _screans = [
      {
        'Screan': CategoriesScrean(),
        'title': 'Trips Categories',
      },
      {
        'Screan': FavoritScrean(favoritsTraps: widget.favoritsTraps),
        'title': 'Favorites Travles',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(
          textAlign: TextAlign.center,
          _screans[_selectedScreanIndex]['title'].toString(),
        ),
      ),
      drawer: DrawerApp(),
      body: _screans[_selectedScreanIndex]['Screan'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 179, 176, 176),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreanIndex,
        onTap: _selectPages,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
