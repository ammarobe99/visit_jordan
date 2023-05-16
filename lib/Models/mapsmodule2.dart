class MapsModel1 {
  final String siteName;
  final String siteImage;
  final double longitude;
  final double latitude;

  MapsModel1(
      {required this.siteName,
      required this.siteImage,
      required this.longitude,
      required this.latitude});
}

//=============================================================================
class Data {
  static List<MapsModel1> item = [
    MapsModel1(
      siteName: 'Wadi Rum',
      siteImage: 'assets/news99.jpg',
      longitude: 32.54049639339564,
      latitude: 35.85265757774946,
    ),
    MapsModel1(
        siteName: 'Petra',
        siteImage: 'assets/petra3.jpeg',
        longitude: 30.32863032488679,
        latitude: 35.444389026300016),
    MapsModel1(
        siteName: ' Jerash',
        siteImage: 'assets/jarash.jpeg',
        longitude: 32.27606865580964,
        latitude: 35.89141636208226),
    MapsModel1(
        siteName: ' Ajloun',
        siteImage: 'assets/ajloun.jpeg',
        longitude: 32.32535473228977,
        latitude: 35.727364073724964),
    MapsModel1(
        siteName: ' Um Qais',
        siteImage: 'assets/umqais.jpeg',
        longitude: 32.65507512206411,
        latitude: 35.687794176731785),
    MapsModel1(
        siteName: ' Karak',
        siteImage: 'assets/karak.jpeg',
        longitude: 31.18115781028049,
        latitude: 35.70167273329226),
    MapsModel1(
        siteName: ' Amman Roman Theater',
        siteImage: 'assets/amman.jpeg',
        longitude: 31.951752638007747,
        latitude: 35.93932141791834),
  ];
}

class MapsModel2 {
  final String siteName;
  final String siteImage;
  final double longitude;
  final double latitude;

  MapsModel2(
      {required this.siteName,
      required this.siteImage,
      required this.longitude,
      required this.latitude});
}

class Data2 {
  static List<MapsModel2> item = [
    MapsModel2(
      siteName: 'Wadi Rum',
      siteImage: 'assets/news99.jpg',
      longitude: 32.54049639339564,
      latitude: 35.85265757774946,
    ),
    MapsModel2(
        siteName: 'Petra',
        siteImage: 'assets/petra3.jpeg',
        longitude: 30.32863032488679,
        latitude: 35.444389026300016),
    MapsModel2(
        siteName: ' Jerash',
        siteImage: 'assets/jarash.jpeg',
        longitude: 32.27606865580964,
        latitude: 35.89141636208226),
    MapsModel2(
        siteName: ' Ajloun',
        siteImage: 'assets/ajloun.jpeg',
        longitude: 32.32535473228977,
        latitude: 35.727364073724964),
    MapsModel2(
        siteName: ' Um Qais',
        siteImage: 'assets/umqais.jpeg',
        longitude: 32.65507512206411,
        latitude: 35.687794176731785),
    MapsModel2(
        siteName: ' Karak',
        siteImage: 'assets/karak.jpeg',
        longitude: 31.18115781028049,
        latitude: 35.70167273329226),
    MapsModel2(
        siteName: ' Amman Roman Theater',
        siteImage: 'assets/amman.jpeg',
        longitude: 31.951752638007747,
        latitude: 35.93932141791834),
  ];
}
