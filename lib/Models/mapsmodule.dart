class MapsModel {
  final String siteName;
  final String siteImage;
  final double longitude;
  final double latitude;

  MapsModel(
      {required this.siteName,
      required this.siteImage,
      required this.longitude,
      required this.latitude});
}

//=============================================================================
class Data {
  static List<MapsModel> item = [
    MapsModel(
      siteName: 'Wadi Rum',
      siteImage: 'assets/wadirum.jpeg',
      longitude: 32.54049639339564,
      latitude: 35.85265757774946,
    ),
    MapsModel(
        siteName: 'Petra',
        siteImage: 'assets/petra3.jpeg',
        longitude: 30.32863032488679,
        latitude: 35.444389026300016),
    MapsModel(
        siteName: ' Jerash',
        siteImage: 'assets/jarash.jpeg',
        longitude: 32.27606865580964,
        latitude: 35.89141636208226),
    MapsModel(
        siteName: ' Ajloun',
        siteImage: 'assets/ajloun.jpeg',
        longitude: 32.32535473228977,
        latitude: 35.727364073724964),
    MapsModel(
        siteName: ' Um Qais',
        siteImage: 'assets/umqais.jpeg',
        longitude: 32.65507512206411,
        latitude: 35.687794176731785),
    MapsModel(
        siteName: ' Karak',
        siteImage: 'assets/karak.jpeg',
        longitude: 31.18115781028049,
        latitude: 35.70167273329226),
    MapsModel(
        siteName: ' Roman Theater',
        siteImage: 'assets/amman.jpeg',
        longitude: 31.951752638007747,
        latitude: 35.93932141791834),
  ];
}
