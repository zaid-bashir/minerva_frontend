// ignore_for_file: prefer_const_constructors, avoid_print, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
// import 'package:minerva_frontend/datacontroller/apiresponse.dart';
import 'package:minerva_frontend/services/api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ApiResponse<Map<String,dynamic>> responsePlaylist;
  ApiServices apiServices = ApiServices();


  var colorizeColors = [
    Colors.purple,
  ];

  var colorizeTextStyle = TextStyle(
    fontSize: 18.0,
    fontFamily: 'Horizon',
    fontWeight: FontWeight.w600,
  );

  @override
  void initState() {
    super.initState();
    // getData();
  }

  // Future<void> getData() async {
  //   responsePlaylist = await ApiServices.getPlaylist();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Minerva Flutter Test",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: ApiServices.getPlaylist(),
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10,),
                  Text("Loading Data From Backend Services..."),
                ],
              ));
            }else{
              return ListView(
                children: [
                  DataTable(columns: (snapshot.data['result'][0] as Map<String,dynamic>).keys.map((e){
                    return DataColumn(label: Text(e));
                  }).toList(), rows: [],),
                  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Showing Data From API Call",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Id's From API Call",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900),),
            ),
            //Testing Purpose...
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(snapshot.data['result'][0]['_id'].toString()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Title From API Call",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900),),
            ),
            //Testing Purpose...
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(snapshot.data['result'][0]['title'].toString()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Danceability From API Call",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900),),
            ),
            //Testing Purpose...
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(snapshot.data['result'][0]['danceability'].toString()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Energy From API Call",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900),),
            ),
            //Testing Purpose...
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(snapshot.data['result'][0]['energy'].toString()),
            ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
