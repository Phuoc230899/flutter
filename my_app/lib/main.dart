import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'TMT Đà Nẵng'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final Widget _contacts = const Contacts();
  final Widget _emails = const Emails();
  final Widget _profile = const Profiles();
  final Widget _home = const Home();
  final _key = GlobalKey<ScaffoldState>();
  

  Widget getBody() {
    if (_selectedIndex == 0) {
      return _home;
    } else if (_selectedIndex == 1) {
      return _emails;
    } else if (_selectedIndex == 2) {
      return _contacts;
    } else {
      return _profile;
    }
  }

  void onTapHandler(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _key.currentState?.openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        title: Center(child: Text(widget.title)),
      ),
      drawer: SidebarX(
        controller: SidebarXController(selectedIndex: _selectedIndex),
        theme:  SidebarXTheme(
          // height: 700,
          itemTextPadding: const EdgeInsets.only(left: 30),
          selectedItemTextPadding: const EdgeInsets.only(left: 30),
          itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color.fromARGB(255, 103, 102, 102)),
        ),
        ),
        extendedTheme: const SidebarXTheme(
              width: 200, margin: EdgeInsets.only(right: 10)),
        items: [
          SidebarXItem(
            icon: Icons.home,
            label: "Home",
            onTap: () {
              onTapHandler(0);
              _key.currentState?.closeDrawer();
            },
          ),
          SidebarXItem(
            icon: Icons.email,
            label: "Emails",
            onTap: () {
              onTapHandler(1);
              _key.currentState?.closeDrawer();
            },
          ),
          SidebarXItem(
            icon: Icons.contacts,
            label: "Contacts",
            onTap: () {
              onTapHandler(2);
              _key.currentState?.closeDrawer();
            },
          ),
          SidebarXItem(
            icon: Icons.person,
            label: "Profile",
            onTap: () {
              onTapHandler(3);
              _key.currentState?.closeDrawer();
            },
          )
        ],
        ),
      body: getBody(),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   items: const [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.contacts), label: "Contacts"),
      //     BottomNavigationBarItem(icon: Icon(Icons.email), label: "Emails"),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
      //   ],
      //   selectedItemColor: Colors.blue,
      //   currentIndex: _selectedIndex,
      //   onTap: (int index) {
      //     onTapHandler(index);
      //   },
      // ),
    );
//     return Scaffold(
//         body: Row(
//       children: [
//         SidebarX(
//           controller: SidebarXController(selectedIndex: _selectedIndex),
//           extendedTheme: const SidebarXTheme(
//               width: 200, margin: EdgeInsets.only(right: 10)),
//           // headerBuilder: (context, extended) {
//           //   return SizedBox(
//           //       height: 100,
//           //       child: Padding(
//           //         padding: const EdgeInsets.all(16.0),
//           //         child: Image.asset('p1.hpg'),
//           //       ));
//           // },
//           items: [
//             SidebarXItem(
//               icon: Icons.home,
//               label: "Home",
//               onTap: () {
//                 onTapHandler(0);
//               },
//             ),
//             SidebarXItem(
//               icon: Icons.email,
//               label: "Emails",
//               onTap: () {
//                 onTapHandler(1);
//               },
//             ),
//             SidebarXItem(
//               icon: Icons.contacts,
//               label: "Contacts",
//               onTap: () {
//                 onTapHandler(2);
//               },
//             ),
//             SidebarXItem(
//               icon: Icons.person,
//               label: "Profile",
//               onTap: () {
//                 onTapHandler(3);
//               },
//             )
//           ],
//         ),
//         getBody()
//       ],
//     ));
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Home"),
    );
  }
}

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Contacts"),
    );
  }
}

class Emails extends StatelessWidget {
  const Emails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Emails"),
    );
  }
}

class Profiles extends StatelessWidget {
  const Profiles({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Profile"),
    );
  }
}
