import 'package:flutter/material.dart';

import 'package:visit_jordan/Models/wethar.dart';
import 'package:visit_jordan/Services/wethar.dart';

import 'package:visit_jordan/utils/colors.dart';



class wethar_secreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _wethar_secreenState();
}

class _wethar_secreenState extends State<wethar_secreen> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  WeatherResponse? _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
      backgroundColor:secondaryColor,
      
   
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_response != null)
                Column(
                  children: [
                    Image.network(_response!.iconUrl),
                    Text(
                      '${((_response!.tempInfo.temperature-32)*0.5).toInt()}°',
                      style: TextStyle(fontSize: 40, color: Colors.amber) ,
                    ),
                    Text(_response!.weatherInfo.description ,style: TextStyle(color: Colors.amber),)
                  ],
                ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: TextFormField(
                  controller: _cityTextController,
                  decoration: const InputDecoration(
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Icon(
                        Icons.location_city,
                        color: Color.fromARGB(255, 37, 37, 37),
                      ), // icon is 48px widget.
                    ),
                    border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                    labelText: 'city',
                    labelStyle: TextStyle(fontSize: 20),
                  ),
                ),
                height: 55,
                width: 350,
              ),
              SizedBox(
                height: 5,
              ),
              ElevatedButton.icon(
                
                  onPressed: _search,
                  icon: Icon(Icons.search),
                  label: Text("search")),
                
            ],
          ),
        ),
      ),
    ));
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }
}
