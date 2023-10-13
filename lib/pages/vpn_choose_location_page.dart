import 'dart:math';

import 'package:flutter/material.dart';

class VpnChooseLocationPage extends StatelessWidget {
  final instanceOfChooseLocationRow = ChooseLocationRow();
  static final connectionStatusImagePathList = <String>[
    "assets/connection/connection_",
    "assets/connection/connection_",
    "assets/connection/connection_",
    "assets/connection/connection_",
    "assets/connection/connection_",
    "assets/connection/connection_",
    "assets/connection/connection_",
  ];
  final countryList = <Country>[
    Country(
        imagePath: 'assets/flags/Amarica.png',
        countryName: 'Amarica',
        connectionStatusPath: connectionStatusImagePathList,
        connectionCirclePath: "assets/connection/connection_circle.png"),
    Country(
        imagePath: 'assets/flags/canada.png',
        countryName: 'Canada',
        connectionStatusPath: connectionStatusImagePathList,
        connectionCirclePath: "assets/connection/connection_circle.png"),
    Country(
        imagePath: 'assets/flags/england.png',
        countryName: 'England',
        connectionStatusPath: connectionStatusImagePathList,
        connectionCirclePath: "assets/connection/connection_circle.png"),
    Country(
        imagePath: 'assets/flags/germany.png',
        countryName: 'Germany',
        connectionStatusPath: connectionStatusImagePathList,
        connectionCirclePath: "assets/connection/connection_circle.png"),
    Country(
        imagePath: 'assets/flags/italy.png',
        countryName: 'Italy',
        connectionStatusPath: connectionStatusImagePathList,
        connectionCirclePath: "assets/connection/connection_circle.png"),
    Country(
        imagePath: 'assets/flags/japon.png',
        countryName: 'Japon',
        connectionStatusPath: connectionStatusImagePathList,
        connectionCirclePath: "assets/connection/connection_circle.png"),
    Country(
        imagePath: 'assets/flags/turk.png',
        countryName: 'Turkey',
        connectionStatusPath: connectionStatusImagePathList,
        connectionCirclePath: "assets/connection/connection_circle.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Sample'),
          bottom: const TabBar(
            padding: EdgeInsets.symmetric(horizontal: 20),
            tabs: <Widget>[
              Tab(
                text: 'Location',
              ),
              Tab(
                text: 'Streaming',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: countryList.length,
                itemBuilder: (context, index) {
                  return instanceOfChooseLocationRow
                      .generateChooseLocationRow(countryList[index].imagePath,countryList[index].countryName,connectionStatusImagePathList);
                },
              ),
            ),
            Center(
              child: Text("It's rainy here"),
            ),
          ],
        ),
      ),
    );
  }
}

class Country {
  final String imagePath;
  final String countryName;
  final List<String> connectionStatusPath;
  final String connectionCirclePath;

  Country({
    required this.imagePath,
    required this.countryName,
    required this.connectionStatusPath,
    required this.connectionCirclePath,
  });
}

class ChooseLocationRow {
  Widget generateChooseLocationRow(String imagePath,String countryName,List<String> statusPathList) {
    List<int> randomElementList = randomNumberAndList();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                imagePath,
                height: 50,
                width: 50,
              ),
            ),
            SizedBox(width: 20,),
            Text(countryName,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            SizedBox(width: 120,),
            Align(alignment: Alignment.center,child: Image.asset(statusPathList[0]+randomElementList[0].toString()+".png",height: 70,width: 70,),),
            SizedBox(width: 5  ,),
            Image.asset('assets/connection/connection_circle.png',width: 30,height: 30  ,)

          ],
        ),
        Divider(
          height: 2,
        ),
      ],
    );
  }

  List<int> randomNumberAndList(){
    Random random = new Random();
    List<int> randomElementList = <int>[];
    for (var i = 0; i < 6; i++) {
      int randomNumber = random.nextInt(5);
      randomElementList.add(randomNumber);
    }
    return randomElementList;

  }
}
