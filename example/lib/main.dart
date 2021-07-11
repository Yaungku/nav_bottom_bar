import 'package:flutter/material.dart';
import 'package:nav_bottom_bar/nav_bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String body = "Home";
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'example app',
          ),
        ),
        body: Stack(
          children: [
            Center(
              child: Text(
                body,
                style: TextStyle(fontSize: 32),
              ),
            ),
            Positioned(
              //to adjust position from button
              bottom: 15,
              child: NavBottomBar(
                showBigButton: true,
                bigIcon: Icons.add,
                currentIndex: index,
                btnOntap: () {
                  setState(() {
                    body = "Big Button Pressed";
                  });
                },
                buttonPosition: ButtonPosition.start,
                children: [
                  NavIcon(
                    icon: Icons.home,
                    onTap: () {
                      setState(
                        () {
                          index = 0;
                          body = "Home";
                        },
                      );
                    },
                  ),
                  NavIcon(
                    icon: Icons.history,
                    onTap: () {
                      setState(
                        () {
                          index = 1;
                          body = "History";
                        },
                      );
                    },
                  ),
                  NavIcon(
                    icon: Icons.notifications,
                    onTap: () {
                      setState(
                        () {
                          index = 2;
                          body = "Notification";
                        },
                      );
                    },
                  ),
                  NavIcon(
                    icon: Icons.person,
                    onTap: () {
                      setState(
                        () {
                          index = 3;
                          body = "Profile";
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
