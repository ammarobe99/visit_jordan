import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:url_launcher/url_launcher.dart';

import '../Models/mapsmodule.dart';

import '../Screens/map.dart';

class MapsScreen1 extends StatefulWidget {
  const MapsScreen1({super.key});

  @override
  _MapsScreen1State createState() => _MapsScreen1State();
}

class _MapsScreen1State extends State<MapsScreen1> {
  List historic = ['petra', 'wadirum', 'amman', 'jarash', 'ajloun', 'um qais'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MasonryGridView.count(
        physics: BouncingScrollPhysics(),
        crossAxisCount: 1,
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
