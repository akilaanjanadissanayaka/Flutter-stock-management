import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stock_management/components/side_navbar.dart';
import 'package:stock_management/pages/my_drawer_header.dart';
import 'package:stock_management/pages/views/dashboard.dart';
import 'package:stock_management/pages/views/about.dart';



class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void SignUserOut() async {
    await FirebaseAuth.instance.signOut();
  }
   var currentPage = DrawerSections.Dashboard ;
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.Dashboard) {
      container = const Dashboard();
    } else if (currentPage == DrawerSections.About) {
      container = About();
    } 
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: SignUserOut, icon: Icon(Icons.logout))
      ]),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              const MyHeaderDrawer(),
              MyDrawerList(),
            ]),
          ),
        ),
      ),
      body: container,
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Dashboard", Icons.playlist_add_outlined,
              currentPage == DrawerSections.Dashboard ? true : false),
          menuItem(2, "About", Icons.people_alt_outlined,
              currentPage == DrawerSections.About ? true : false),
          
          const Divider(),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.Dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.About;
            } 
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections { Dashboard, About }