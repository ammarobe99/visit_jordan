import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MapsUtils {
  MapsUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
    log('latitude $latitude');
    log('longitude $longitude');
    String googleUrl =
        'https://www.google.com/maps/search/?api=l&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map';
    }
  }

  static Future<void> openMaps(
      BuildContext context, double lat, double lng) async {
    String url = '';

    url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
