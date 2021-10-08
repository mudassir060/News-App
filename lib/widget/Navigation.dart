// ignore_for_file: avoid_print, file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:news_app/Api/login.dart';
import 'package:news_app/Page/Favourit.dart';
import 'package:news_app/Page/HomeScreen/Headlines.dart';
import 'package:news_app/Page/HomeScreen/PopularNews%20.dart';
import 'package:news_app/Page/HomeScreen/SportsNews.dart';
import 'package:news_app/Page/HomeScreen/TopStories.dart';
import 'package:news_app/Page/Profile.dart';
import 'package:news_app/Page/Search.dart';
import 'package:news_app/widget/Logout.dart';
import 'package:news_app/widget/NotSigin.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);
  final Map UserData;

  // ignore: non_constant_identifier_names
  HomePage({required this.UserData});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double value = 0;
  var Navigatio = 0;
  int _selectedIndex = 0;
  var appBarTitleText = const Center(child: Text("PAK News"));
  @override
  Widget build(BuildContext context) {
    _openPopup(context) {
      String _search = '';
      Alert(
          context: context,
          title: "Search",
          content: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.account_circle),
                  labelText: 'Search',
                ),
                onChanged: (text) {
                  setState(() {
                    _search = text;
                  });
                },
              ),
            ],
          ),
          buttons: [
            DialogButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Search(Text: _search),
                ),
              ),
              child: Text(
                "Search",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ]).show();
    }

    print('+++++++++++++++++++++++++++++++++++++');
    print(
        "{============================================================>${widget.UserData}}");
    final Page = [
      HomePage(
        UserData: widget.UserData,
      ),
      widget.UserData == null
          ? NotSigin()
          : ProfilePage(UserData: widget.UserData),
                widget.UserData == null
          ? NotSigin()
          :Favourit(UserData: widget.UserData) ,
      
      const Logout()
    ];

    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.blue,
                  Colors.blue,
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
              ),
              SafeArea(
                  child: Container(
                width: 200.0,
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    DrawerHeader(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // CircleAvatar(
                        //   radius: 50.0,
                        //   backgroundImage: NetworkImage("widget.UserProfile"),
                        // ),

                        widget.UserData == null
                            ? TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Login(),
                                    ),
                                  );
                                },
                                child: Text("Login"))
                            : Text(
                                widget.UserData['Name'],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                      ],
                    )),
                    Expanded(
                        child: ListView(
                      children: [
                        ListTile(
                          onTap: () {
                            setState(() {
                              _selectedIndex = 0;
                              value = 0;
                              appBarTitleText =
                                  const Center(child: Text("Home"));
                            });
                          },
                          leading: const Icon(Icons.home, color: Colors.white),
                          title: const Text(
                            'Home',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            setState(() {
                              _selectedIndex = 1;
                              value = 0;
                              appBarTitleText =
                                  const Center(child: Text("Profile"));
                            });
                          },
                          leading:
                              const Icon(Icons.person, color: Colors.white),
                          title: const Text(
                            'Profile',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            setState(() {
                              _selectedIndex = 2;
                              value = 0;
                              appBarTitleText =
                                  const Center(child: Text("Favourit"));
                            });
                          },
                          leading: const Icon(Icons.warning_amber,
                              color: Colors.white),
                          title: const Text(
                            'Favourit',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            setState(() {
                              _selectedIndex = 3;
                              value = 0;
                              appBarTitleText =
                                  const Center(child: Text("Logout"));
                            });
                          },
                          leading:
                              const Icon(Icons.settings, color: Colors.white),
                          title: const Text(
                            'Logout',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              )),
              TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: value),
                  duration: const Duration(microseconds: 500),
                  curve: Curves.easeInExpo,
                  builder: (_, double val, __) {
                    return (Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..setEntry(0, 3, 200 * val),
                      // ..rotateY((pi / 6) * val),
                      child: DefaultTabController(
                        length: 4,
                        child: Scaffold(
                          appBar: AppBar(
                              title: appBarTitleText,
                              actions: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(right: 20.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        _openPopup(context);
                                      },
                                      child: Icon(
                                        Icons.search,
                                        size: 26.0,
                                      ),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(right: 20.0),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Icon(Icons.more_vert),
                                    )),
                              ],
                              leading: IconButton(
                                icon: const Icon(Icons.menu),
                                tooltip: 'Main Menu',
                                onPressed: () {
                                  if (value == 0) {
                                    setState(() {
                                      value = 1;
                                    });
                                  } else {
                                    setState(() {
                                      value = 0;
                                    });
                                  }
                                  print(value);
                                },
                              ),
                              bottom: _selectedIndex == 0
                                  ? const TabBar(
                                      unselectedLabelColor: Colors.white60,
                                      labelColor: Colors.white,
                                      indicatorColor: Colors.white,
                                      tabs: [
                                          Tab(
                                              child: Text(
                                            'Top Stories',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
                                          Tab(
                                            child: Text(
                                              'Headlines',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Tab(
                                            child: Text(
                                              'Sports News',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Tab(
                                            child: Text(
                                              'Popular News',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ])
                                  :null),
                          body: _selectedIndex == 0
                              ?  TabBarView(children: [
                                  TopStories(UserData: widget.UserData),
                                  Headlines(UserData: widget.UserData),
                                  SportsNews(UserData: widget.UserData),
                                  PopularNews(UserData: widget.UserData),
                                ])
                              : Page[_selectedIndex],
                        ),
                      ),
                    ));
                  }),
              GestureDetector(
                onHorizontalDragUpdate: (e) {
                  // print(e.delta.dx);
                  if (e.delta.dx > 0) {
                    setState(() {
                      value = 1;
                    });
                  } else {
                    setState(() {
                      value = 0;
                    });
                  }
                  print(value);
                },
                // onTap: () {
                //   setState(() {
                //     value == 0 ? value = 1 : value = 0;
                //   });
                // },
              )
            ],
          ),
        ),
      ),
    );
  }
}
