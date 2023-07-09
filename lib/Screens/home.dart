import 'package:flutter/material.dart';
import 'package:visit_jordan/Screens/central.dart';
import 'package:visit_jordan/Screens/north.dart';
import 'package:visit_jordan/Screens/south.dart';
import 'package:visit_jordan/home-components/tobtabbar.dart';


class MyGestureDetector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:ListView(children: [GestureDetector(
      onTap: () {
        // Navigate to another screen on tap
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  north()),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset('assets/umm-qais.webp'),
            SizedBox(height: 16.0),
            Text(
              'Northern Regions',
              style: TextStyle(fontSize: 25.0),
            ),
            SizedBox(height: 8.0),
            Icon(Icons.apartment),
          ],
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        // Navigate to another screen on tap
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  Central()),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset('assets/amman.jpeg'),
            SizedBox(height: 16.0),
            Text(
              'Central Regions',
              style: TextStyle(fontSize: 25.0),
            ),
            SizedBox(height: 8.0),
            Icon(Icons.apartment),
          ],
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        // Navigate to another screen on tap
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  south()),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset('assets/Aqaba.jpg'),
            SizedBox(height: 16.0),
            Text(
              'Southern Regions',
              style: TextStyle(fontSize: 25.0),
            ),
            SizedBox(height: 8.0),
            Icon(Icons.apartment),
          ],
        ),
      ),
    )],) ,
    
    );
  }
}
