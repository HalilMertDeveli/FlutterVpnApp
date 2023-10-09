import 'package:flutter/material.dart';

class VpnChooseLocationPage extends StatelessWidget {
  VpnChooseLocationPage({super.key});
  final temproryLocaitonList = [
    TemproryLocation(
      locationName: "Turkey",
      locationIcon: Icon(Icons.turn_left),
    ),
    TemproryLocation(
      locationName: "US",
      locationIcon: Icon(Icons.access_alarm_outlined),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    ListViewBuilderRow listViewBuilderRowInstance = new ListViewBuilderRow();

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
                itemCount: temproryLocaitonList.length,
                itemBuilder: (context, index) {
                  return listViewBuilderRowInstance.ListViewBuilderRow(
                      temproryLocaitonList, index);

                  // ListTile(
                  //   leading: temproryLocaitonList[index].locationIcon,
                  //   title: Text(temproryLocaitonList[index].locationName.toUpperCase()),
                  // );
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

class TemproryLocation {
  final String locationName;
  final Icon locationIcon;

  TemproryLocation({required this.locationName, required this.locationIcon});
}

class ListViewBuilderRow extends IListViewBuilderRow {}

abstract class IListViewBuilderRow {
  Widget ListViewBuilderRow(
      List<TemproryLocation> temproryLocation, int index) {
    return Container(
      color: Colors.black,
      height: 100,
      width: double.infinity,
      child: ListTile(
        leading: temproryLocation[index].locationIcon,
        title: Text(
          temproryLocation[index].locationName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
