import 'package:flutter/material.dart';
import 'package:travels_app/screans/filter_screan.dart';

class DrawerApp extends StatelessWidget {
  //const Drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Color.fromARGB(255, 203, 199, 199),
            child: Text(
              'Travel Guide',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildDrawermethod('Home', Icons.card_travel, () {
            Navigator.of(context).pushNamed('/categories_trips');
          }),
          buildDrawermethod('Filter', Icons.filter_list, () {
            Navigator.of(context).pushNamed(FilterScrean.ScreanRoute);
          }),
          buildDrawermethod('Setting', Icons.settings, () {}),
        ],
      ),
    );
  }

  Widget buildDrawermethod(String title, IconData icon, Function onTapLink) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      onTap: onTapLink.toString,
    );
  }
}
