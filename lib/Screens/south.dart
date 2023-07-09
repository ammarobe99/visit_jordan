import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visit_jordan/widgets/drawer.dart';

class south extends StatelessWidget {
  final List<Place> places = [
    Place(
        image: 'assets/petra6.jpg',
        name: 'Petra',
        description:
            ' is half-built, half-carved into the rock, and is surrounded by mountains riddled with passages and gorges. It is one of the worlds most famous archaeological sites, where ancient Eastern traditions blend with Hellenistic architecture',
        location:'petra'
    ),
    Place(
        image: 'assets/wadi-rum1.jpeg',
        name: 'Wadi Rum',
        description:
            'Wadi Rum is a protected area covering 720 square kilometers of dramatic desert wilderness in the south of Jordan. Huge mountains of sandstone and granite emerge, sheer-sided, from wide sandy valleys to reach heights of 1700 meters and more. Narrow canyons and fissures cut deep into the mountains and many conceal ancient rock drawings etched by the peoples of the desert over millennia. Bedouin tribes still live among the mountains of Rum and their large goat-hair tents are a special feature of the landscape.',
        location: 'wadi rum'
       
        ),
   
        
    Place(
        image: 'assets/Karak_Castle_2.jpg',
        name: 'Karak castel',
        description:
            ' a dark maze of stone-vaulted halls and endless passageways. The best preserved are underground and can be reached via a massive door (ask at the ticket desk). More imposing than beautiful, the castle is nevertheless an impressive insight into the architectural military genius of the Crusaders',
        location:'Karak castel'
    ),
   
    Place(
        image: 'assets/Aqaba.jpg',
        name: 'Aqaba',
        description: 'Aqaba is a resort city and a port city, with tourism a major industry and undergoing a major expansion with new luxury neighborhoods, attractions, and hotels opening. The main attraction of Aqaba is, of course, its Red Sea coastline, and the beaches, diving, watersports, and coastal resorts, that come with that.',
        location: 'Aqaba'
    ),
    Place(
        image: 'assets/petrahotal.jpg',
        name: 'Petra moon hotel',
        description: 'petra moon hotel . 5 star Just 100 yards from the entrance gate to Petra, this hotel features spacious rooms with flat-screen TVs.It also has a roof garden with a seasonal outdoor pool. ',
  
        location: 'فندق قمر البتراء'
        
        ),
    Place(
        image: 'assets/rumhotel.jpg',
        name: 'Memories Aicha Luxury Camp',
        description:
            "5 star Featuring mountain views Memories Aicha Luxury Camp in Wadi Rum features accommodation,a garden, a terrace and barbecue facilities.The daily breakfast offers buffet, à la carte or continental options. At the luxury tent you will find a restaurant serving Mediterranean and local cuisine. Vegetarian, vegan and dairy-free options can also be requested.",
        location: 'ميموريز عايشة لكجري كامب، '
        
        ),
    Place(
        image: 'assets/aqabahotel.jpg',
        name: 'Marina Plaza Hotel Tala Bay',
        description:
            'Just 250 meters from Aqaba Beach, this hotel offers guests a free shuttle service to the center of Aqaba. It offers modern rooms with air conditioning and satellite TV. Available facilities include Tala Bay Beach Club and outdoor swimming pools.',
        location: 'Marina Plaza Hotel Tala Bay aqaba'
       
        ),
    
     
    // Add more places here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(  drawer: MyDrawer(),
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

