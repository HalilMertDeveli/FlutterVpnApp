import 'package:flutter/material.dart';
import 'package:vpn_app_upwork/pages/vpn_choose_location_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPressedToButton = false;

  void simulatePress() {
    setState(() {
      isPressedToButton = true;
    });

    // Simulate someone else pressing the button for 2 seconds.
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isPressedToButton = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 4, 3),
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Color.fromARGB(255, 35, 34, 34),
        elevation: 0,
        actions: [
          IconButton(
            iconSize: 40,
            icon: Icon(
              Icons.network_cell,
              color: Colors.blueGrey,
            ),
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => VpnChooseLocationPage(),));
            },
          ),
          IconButton(
            icon: Icon(
              Icons.money,
              color: Colors.amber,
            ),
            onPressed: () => print(
              "you have pressed the network button",
            ),
            iconSize: 40,
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.black87,
        child: ListView(
          // padding: const EdgeInsets.symmetric(vertical: 50),
          padding: EdgeInsets.symmetric(vertical: 50),
          children: [
            // const DrawerHeader(
            //   //margin: EdgeInsets.symmetric(vertical: 5,horizontal: 2),
            //   padding: EdgeInsets.fromLTRB(16.0, 2.0, 16.0, 2.0),
            //   decoration: BoxDecoration(
            //     //color: Colors.black87,
            //     color: Colors.white

            //   ),
            //   child:
            // ),
            Icon(
              Icons.account_circle,
              size: 150,
              color: Colors.grey,
            ),
            const Divider(
              height: 2,
            ),
            GestureDetector(
              onTap: () => print("Account"),
              child: ListTile(
                leading: Icon(
                  Icons.account_balance,
                  color: Colors.white54,
                ),
                title: Text(
                  'Account',
                  style: TextStyle(color: Colors.white54),
                ),
              ),
            ),
            const Divider(
              height: 2,
            ),
            GestureDetector(
              onTap: () => print("setting"),
              child: ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.white54,
                ),
                title: Text(
                  'Settings',
                  style: TextStyle(color: Colors.white54),
                ),
              ),
            ),
            const Divider(
              height: 2,
            ),
            GestureDetector(
              onTap: () => print("apps filter"),
              child: ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.white54,
                ),
                title: Text(
                  'Apps filter',
                  style: TextStyle(color: Colors.white54),
                ),
              ),
            ),
            const Divider(
              height: 2,
            ),
            GestureDetector(
              onTap: () => print("rate us"),
              child: ListTile(
                leading: Icon(
                  Icons.star,
                  color: Colors.white54,
                ),
                title: Text(
                  'Rate us',
                  style: TextStyle(color: Colors.white54),
                ),
              ),
            ),
            const Divider(
              height: 2,
            ),
            GestureDetector(
              onTap: () => print("help and feed back"),
              child: ListTile(
                leading: Icon(
                  Icons.message,
                  color: Colors.white54,
                ),
                title: Text(
                  'Help & Feedback',
                  style: TextStyle(color: Colors.white54),
                ),
              ),
            ),
            const Divider(
              height: 2,
            ),
            GestureDetector(
              onTap: () => print("share"),
              child: ListTile(
                leading: Icon(
                  Icons.share,
                  color: Colors.white54,
                ),
                title: Text(
                  'Share',
                  style: TextStyle(color: Colors.white54),
                ),
              ),
            ),
            const Divider(
              height: 2,
            ),
          ],
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: Align(
              child: Image.asset("assets/circut.png"),
              heightFactor: 1.3,
            ),
          ),
          Positioned(
            top: 230,
            right: 160,
            child: InkWell(
              onTap: () =>
                  print("I pressed button with incwell but it is VPN button"),
              child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: isPressedToButton ? Colors.blue : Colors.transparent,
                    borderRadius: BorderRadius.circular(49),
                  ),
                  width: 100,
                  height: 100,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: simulatePress,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
