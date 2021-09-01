import 'package:flutter/material.dart';
import 'package:simpleweatherapp/data_services.dart';
import 'package:simpleweatherapp/models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  WeatherResponse _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffe7feff),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(_response != null)
                Column(
                  children: [
                    Image.network(_response.iconUrl),
                    Text(
                      '${_response.tempInfo.temperature}°C',
                      style: TextStyle(fontSize: 40),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(_response.weatherInfo.description),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Feels like: ${_response.tempInfo.feelslike}'),
                  ],
                ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                child: SizedBox(
                  width: 120,
                  child: TextField(
                    controller: _cityTextController,
                    decoration: InputDecoration(labelText: 'City Name'),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              ElevatedButton(onPressed: _search, child: Text('Search')),
            ],
          ),
        ),
      ),
    );
  }

  void _search() async{
    final response = await _dataService.getWeather(_cityTextController.text);
   setState(() => _response = response);
  }

}
