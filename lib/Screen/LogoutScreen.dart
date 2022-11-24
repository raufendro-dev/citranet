import 'package:citranet/Controller/APIController.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:page_transition/page_transition.dart';
import 'package:cool_alert/cool_alert.dart';
import 'dart:async';
import 'dart:math';
import 'HomeScreen.dart';
import '../Controller/LogController.dart';
import 'LoginScreen.dart';

class LogoutScreen extends StatefulWidget {
  LogoutScreen({super.key, required this.variabel});
  var variabel;

  @override
  _LogoutScreenState createState() => _LogoutScreenState(dataUser: variabel);
}

class _LogoutScreenState extends State<LogoutScreen> {
  _LogoutScreenState({required this.dataUser});
  var dataUser;
  int _selectedIndex = 2;
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                child: HomeScreen(
                  variabel: dataUser,
                )));
      } else if (index == 1) {
      } else if (index == 2) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, top: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Profile',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 100,
                  width: 100,
                  child: TextButton.icon(
                      onPressed: () async {
                        await Logout.logout();
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: LoginScreen()));
                      },
                      icon: Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      label: Text(
                        'Keluar',
                        style: TextStyle(color: Colors.red),
                      )),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 60),
            child: Center(
              child: Container(
                height: 150,
                width: 150,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.memory(
                      base64Decode(dataUser.gambar),
                    )),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Center(
                child: Text(
              dataUser.nama,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Center(
                child: Text(
              'Username : ' + dataUser.username,
              style: TextStyle(fontSize: 15, color: Colors.grey),
            )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, top: 30),
                child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    label: Text(
                      'Ubah Password',
                      style: TextStyle(color: Colors.black),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 30, right: 12),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 15,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.info,
                      color: Colors.black,
                    ),
                    label: Text(
                      'Tentang Kami',
                      style: TextStyle(color: Colors.black),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10, right: 12),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 15,
                ),
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.announcement), label: "Aduan"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
