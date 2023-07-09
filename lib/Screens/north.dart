import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visit_jordan/widgets/drawer.dart';

class north extends StatelessWidget {
  final List<Place> places = [
    // Place(
    //     image: 'assets/petra6.jpg',
    //     name: 'Petra',
    //     description:
    //         ' is half-built, half-carved into the rock, and is surrounded by mountains riddled with passages and gorges. It is one of the worlds most famous archaeological sites, where ancient Eastern traditions blend with Hellenistic architecture',
    //     location:'petra'
    // ),
    // Place(
    //     image: 'assets/wadi-rum1.jpeg',
    //     name: 'Wadi Rum',
    //     description:
    //         'Wadi Rum is a protected area covering 720 square kilometers of dramatic desert wilderness in the south of Jordan. Huge mountains of sandstone and granite emerge, sheer-sided, from wide sandy valleys to reach heights of 1700 meters and more. Narrow canyons and fissures cut deep into the mountains and many conceal ancient rock drawings etched by the peoples of the desert over millennia. Bedouin tribes still live among the mountains of Rum and their large goat-hair tents are a special feature of the landscape.',
    //     location: 'wadi rum'

    //     ),
    Place(
        image: 'assets/jarash.jpeg',
        name: 'Jerash',
        description:
            'is considered one of the largest and most well-preserved sites of Greek and Roman architecture in the world outside Italy. And is sometimes misleadingly referred to as the "Pompeii of the Middle East" or of Asia, referring to its size, extent of excavation and level of preservation',
        location: 'Jerash'),
    Place(
        image: 'assets/Ajloun-Castle.jpeg',
        name: 'Ajloun Castle',
        description:
            'mountains are famous for their lush vegetation and thick green forests, many locals and tourists visit the area for hiking. Its highest mountain peaks reach around 1268 meters above sea level and Ajloun mountains receive a few snow storms every year, usually in the winter season from December to March',
        location: 'Ajloun Castle'),
    Place(
        image: 'assets/umm-qais.webp',
        name: 'Um Qais',
        description:
            'Perched on a splendid hilltop overlooking the Jordan Valley and the Sea of Galilee, Gadara is known today as Umm Qais, and boasts an impressive colonnaded street, a vaulted terrace, and the ruins of two theatres. You can take in the sights and then dine on the terrace of a fine restaurant with a breathtaking view',
        location: 'Um Qais'),
    Place(
        image: 'assets/jerashhotel.jpg',
        name: 'The Olive Branch Hotel',
        description:
            'Olive Branch .2 star Situated on a hill overlooking Dibbin Nature Reserve, Olive Branch offers spacious rooms. It has an outdoor pool with sun-lounger terrace.',
        location: 'The Olive Branch Hotel, جرش'),

    // Add more places here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
          centerTitle: true,
          title: Container(
            child: DefaultTextStyle(
              style: GoogleFonts.dangrek(
                  textStyle: Theme.of(context).textTheme.displayMedium,
                  fontSize: 32),
              child: Text("Visit Jordan"),
            ),
          )),
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          return PlaceCard(place: places[index]);
        },
      ),
    );
  }
}

class Place {
  final String image;
  final String name;
  final String description;
  final String location;

  Place(
      {required this.image,
      required this.name,
      required this.description,
      required this.location});
}

class PlaceCard extends StatelessWidget {
  final Place place;

  PlaceCard({required this.place});

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    try {
      imageWidget = Image.asset(
        place.image,
        fit: BoxFit.cover,
      );
    } catch (e) {
      imageWidget = Text('Error loading image');
    }

    return SingleChildScrollView(
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            imageWidget,
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    place.description,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: IconButton(
                          onPressed: () {
                            openMapsLocation(place.location);
                          },
                          icon: Icon(Icons.location_on),
                          color: Colors.blue,
                          iconSize: 30,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void openMapsLocation(String location) async {
  final mapsUrl = 'https://www.google.com/maps/search/?api=1&query=$location';

  if (await canLaunch(mapsUrl)) {
    await launch(mapsUrl);
  } else {
    throw 'Could not launch $mapsUrl';
  }
}
