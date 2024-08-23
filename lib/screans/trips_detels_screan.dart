import 'package:flutter/material.dart';
import 'package:travels_app/models/trips.dart';
import '../app_data.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widget/trips_items.dart';

class TripsDetelsScrean extends StatelessWidget {
  // const TripsDetelsScrean({super.key});
  final Function managFavoritTrips;
  final Function _isInFav;

  TripsDetelsScrean(this.managFavoritTrips, this._isInFav);

  static const screanRoute = '/trip_detels';

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)!.settings.arguments as String;
    final SelectedTrip = Trips_data.firstWhere((Trip) => Trip.id == tripId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${SelectedTrip.title}'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 300,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  SelectedTrip.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Text(
                'Activites',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              height: 230,
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: SelectedTrip.activities.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0.4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Text(SelectedTrip.activities[index],
                          style: GoogleFonts.gupter(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Text(
                'Program',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              height: 230,
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: SelectedTrip.program.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Text('day ${index + 1}'),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Text(SelectedTrip.program[index],
                              style: GoogleFonts.gupter(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Divider()
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 90,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 128, 186, 234),
        child: Icon(_isInFav(tripId) ? Icons.star : Icons.star_border),
        onPressed: () {
          return managFavoritTrips(tripId);
        },
      ),
    );
  }
}
