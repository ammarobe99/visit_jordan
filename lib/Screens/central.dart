import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visit_jordan/widgets/drawer.dart';

class Central extends StatelessWidget {
  final List<Place> places = [
     Place(
        image: 'assets/amman.jpeg',
        name: 'Roman Theater',
        description:
            'its tiered, semicircular seating space, carved into the Jabal Al-Jofeh hill in three horizontal sections with a total of 44 rows can seat around 6,000 people. It faces north so that the audiences are protected from the sun. Social rank dictated the places for the audience',
        location:'Roman Theater amman'
    ),
    
    Place(
        image: 'assets/royal.jpg',
        name: 'Le Royal ',
        description:
            'Le Royal 5 star The Le Royal, is one of the tallest buildings in Amman, Jordan. Located in the 3rd Circle area, the building serves as a host of Le Royal Hotel chain in addition to a shopping mall, cinemas and commercial offices. It is a major landmark in Amman and one of the tallest buildings in Amman. 31 floors.',
        location: 'Le Royal amman'
     
        ),
    
   
   
    // Add more places here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold( drawer: MyDrawer(),
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
                  IconButton(
                    onPressed: () {
                      openMapsLocation(place.location);
                    },
                    icon: Icon(Icons.location_on),
                    color: Colors.blue,
                    iconSize: 30,
                  ),

                 
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




