import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import '../Models/mapsmodule.dart';
import 'mapsutils.dart';

class MapsCardView extends StatelessWidget {
  const MapsCardView({
    Key? key,
    required this.mapsModel,
  }) : super(key: key);
  final MapsModel mapsModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        String appleUrl =
            'https://maps.apple.com/?saddr=&daddr=${mapsModel.longitude},${mapsModel.latitude}&directionsmode=driving';
        String googleUrl =
            'https://www.google.com/maps/search/?api=1&query=${mapsModel.longitude},${mapsModel.latitude}';

        if (Platform.isIOS) {
          if (await canLaunchUrl(Uri.parse(googleUrl))) {
            await launchUrl(Uri.parse(googleUrl));
          } else if (await canLaunchUrl(Uri.parse(appleUrl))) {
            await launchUrl(Uri.parse(appleUrl));
          } else {
            throw 'Could not open the map.';
          }
        } else {
          MapsUtils.openMaps(context, mapsModel.longitude, mapsModel.latitude);
        }
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(9)),
        ),
        child: Container(
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: AssetImage(mapsModel.siteImage),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                  child: Container(
                      height: 36,
                      width: double.infinity,
                      decoration:
                          BoxDecoration(color: Colors.white.withOpacity(0.3)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: InkWell(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.map_outlined,
                                    color: Colors.white,
                                  )),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 10),
                                  child: Text(
                                    '${mapsModel.siteName.toString()}',
                                    style: const TextStyle(
                                        // fontFamily: 'Georgia',

                                        fontSize: 16.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.place,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
