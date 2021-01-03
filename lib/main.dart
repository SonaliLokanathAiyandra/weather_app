import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
void main() async{

  Map data=await getAllData();

  print("result "+data['parent']['title'].toString());

  runApp(new MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Center(child: Text('Weather App')),
      ),
      body: new Container(
        height: 800.0,

        child: new Stack(
          children:<Widget> [

            Container(
              height:800,
              color: Colors.amber,
              child: new Image(
                image: AssetImage('assets/image1.webp'),
                fit: BoxFit.cover,
              ),
            ),

            new Positioned(
              bottom: 50.0,
              child: new Container(
                height: 100.0,
               width: 400.0,
               // margin: EdgeInsets.all(10.0),
                color: Colors.deepPurple,
                child: Column(
                  children: [
                    Text(data['sources'][0]['title'].toString(),
                    style: TextStyle(color: Colors.white),
                    ),
                    new SizedBox(height: 5.0),
                    Text(data['sources'][1]['crawl_rate'].toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    )
  ));
}

Future<Map>getAllData()async{

  var api = "https://www.metaweather.com/api/location/2487956/";
  var data = await http.get(api);
  var jsonData = json.decode(data.body);

  return jsonData;

}


