import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:url_launcher/url_launcher.dart';

import '../Models/mapsmodule.dart';

import '../Screens/map.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  List historic = ['petra', 'wadirum', 'amman', 'jarash', 'ajloun', 'um qais'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MasonryGridView.count(
        physics: BouncingScrollPhysics(),
        crossAxisCount: 2,
        // crossAxisSpacing: 3,
        mainAxisSpacing: 5,
        primary: false,
        shrinkWrap: true,
        itemCount: Data.item.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
            onTap: () {},
            child: MapsCardView(
              mapsModel: Data.item[index],
            )),
      ),
    );
  }
}
