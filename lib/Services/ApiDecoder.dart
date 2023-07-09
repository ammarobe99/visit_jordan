import 'package:http/http.dart' as http;
import 'dart:convert';

//this class can be instantiated to get an Api call and then decode it's data and return it
class ApiDecoder {
  String locationUrl;

  ApiDecoder(this.locationUrl);

  Future getData() async {
    http.Response response = await http.get(Uri.parse(locationUrl));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
     
  }
}
