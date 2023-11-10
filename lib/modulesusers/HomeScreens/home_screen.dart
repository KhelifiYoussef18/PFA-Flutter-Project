import 'package:flutter/material.dart';

import 'package:pfa_project/modulesusers/payment/facture/facture.dart';

import '../../modulesAdmin/homeAdmin/homeScreenAdmin.dart';
import 'mydrawerlist/dashboard.dart';
import 'mydrawerlist/events.dart';
import 'mydrawerlist/privacy_policy.dart';
import 'mydrawerlist/profile.dart';
import 'mydrawerlist/send_feedback.dart';
import 'mydrawerlist/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentPage = DrawerSection.contacts;

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final username = routeArgs['user'];
    final initials = username
            ?.split('@')[0]
            .split(RegExp('(?=[A-Z])'))
            .map((e) => e[0])
            .join() ??
        "??";
    var container;

    if (currentPage == DrawerSection.dashboard) {
      container = DashboardScreen();
    } else if (currentPage == DrawerSection.contacts) {
      container = ProfilePage();
    } else if (currentPage == DrawerSection.events) {
      container = events();
    } else if (currentPage == DrawerSection.payment) {
      container = FacturePage();
    } else if (currentPage == DrawerSection.settings) {
      container = Settings();
    } else if (currentPage == DrawerSection.privacy_policy) {
      container = AdminHomePage();
    } else if (currentPage == DrawerSection.send_feedback) {
      container = SendFeedback();
    }

    return Scaffold(
      body: container,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "/");
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.purple.shade50,
                    radius: 30.0,
                    child: Text(
                      initials,
                      style: TextStyle(color: Colors.purple),
                    ),
                  ),
                  accountName: const Text(""),
                  accountEmail: Text(
                    username ?? "",
                    style: TextStyle(
                      color: Colors.purple.shade50,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0, 1],
                      colors: [
                        Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
                        Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
                      ],
                    ),
                  ),
                  child: MyDrawerList(
                      currentPage: currentPage,
                      setPage: (page) {
                        setState(() {
                          currentPage = page;
                        });
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyDrawerList extends StatelessWidget {
  final DrawerSection currentPage;
  final Function setPage;

  const MyDrawerList({
    Key? key,
    required this.currentPage,
    required this.setPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          menuItem(2, "Profile", Icons.people_alt_outlined,
              currentPage == DrawerSection.contacts, setPage),
          menuItem(3, "Events", Icons.event,
              currentPage == DrawerSection.events, setPage),
          menuItem(4, "payment", Icons.payment,
              currentPage == DrawerSection.payment, setPage),
          menuItem(5, "settings", Icons.settings,
              currentPage == DrawerSection.settings, setPage),
          menuItem(6, "Privacy_policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSection.privacy_policy, setPage),
          menuItem(7, "Send_feedback", Icons.feedback_outlined,
              currentPage == DrawerSection.send_feedback, setPage),
        ],
      ),
    );
  }
}

Widget menuItem(
    int id, String title, IconData icon, bool selected, Function setPage) {
  return Material(
    color: selected ? Colors.grey[300] : Colors.transparent,
    child: InkWell(
        onTap: () {
          if (id == 1) {
            setPage(DrawerSection.dashboard);
          } else if (id == 2) {
            setPage(DrawerSection.contacts);
          } else if (id == 3) {
            setPage(DrawerSection.events);
          } else if (id == 4) {
            setPage(DrawerSection.payment);
          } else if (id == 5) {
            setPage(DrawerSection.settings);
          } else if (id == 6) {
            setPage(DrawerSection.privacy_policy);
          } else if (id == 7) {
            setPage(DrawerSection.send_feedback);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(children: [
            Expanded(
                child: Icon(
              icon,
              size: 20,
              color: Colors.black,
            )),
            Expanded(
              flex: 1,
              child: Text(
                title,
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
            ),
          ]),
        )),
  );
}

enum DrawerSection {
  dashboard,
  contacts,
  events,
  payment,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}
