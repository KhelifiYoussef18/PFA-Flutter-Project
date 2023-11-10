import 'package:flutter/material.dart';
import 'package:pfa_project/modulesAdmin/inseresion/insert.dart';
import 'package:pfa_project/modulesAdmin/programme/pragramme.dart';
import 'package:pfa_project/modulesusers/HomeScreens/mydrawerlist/dashboard.dart';
import '../session/insertsession.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  var currentPage = DrawerSection.dashboard;

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
    } else if (currentPage == DrawerSection.session) {
      container = SessionInsert();
    } else if (currentPage == DrawerSection.programme) {
      container = EventForm();
    } else if (currentPage == DrawerSection.settings) {
      container = Insert();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Admin Home"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4),
          child: Container(
            color: Colors.grey[300],
            height: 4,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
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
      body: container,
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
          menuItem(2, "Session", Icons.ad_units_outlined,
              currentPage == DrawerSection.session, setPage),
          menuItem(3, "Programme", Icons.event,
              currentPage == DrawerSection.programme, setPage),
          menuItem(4, "settings", Icons.settings,
              currentPage == DrawerSection.settings, setPage),
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
          setPage(DrawerSection.session);
        } else if (id == 3) {
          setPage(DrawerSection.programme);
        } else if (id == 4) {
          setPage(DrawerSection.settings);
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
      ),
    ),
  );
}

enum DrawerSection { dashboard, session, programme, settings }
