import 'package:citranet/Controller/APIController.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import '../Model/Iklan.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:page_transition/page_transition.dart';

import 'dart:async';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, required this.variabel});
  var variabel;

  @override
  _HomeScreenState createState() => _HomeScreenState(dataUser: variabel);
}

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState({required this.dataUser});
  final pageviewcontroller = PageController();
  var gambarterpilih = 0;
  var dataUser;
  int _selectedIndex = 0;
  List<Tampiliklan> tampiliklanList = [
    Tampiliklan(1, 'iklan 1',
        'https://raw.githubusercontent.com/raufendro-dev/citranet/master/assets/image/iklan/0.png'),
    Tampiliklan(2, 'iklan 2',
        'https://raw.githubusercontent.com/raufendro-dev/citranet/master/assets/image/iklan/1.png'),
    Tampiliklan(3, 'iklan 3',
        'https://raw.githubusercontent.com/raufendro-dev/citranet/master/assets/image/iklan/2.png')
  ];
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
      } else if (index == 1) {
      } else if (index == 2) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  child: Image.asset('assets/image/kotak.png'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 60, left: 15, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Halo, ' + dataUser.nama,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 48,
                        width: 48,
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            child: Image.memory(
                              base64Decode(dataUser.gambar),
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 100, left: 15, right: 20),
                  child: Text(
                    'Pelanggan ID : ' + dataUser.pelangganid.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                height: 160,
                child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        gambarterpilih = index;
                      });
                    },
                    itemCount: tampiliklanList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            image: DecorationImage(
                              image: NetworkImage(tampiliklanList[index].link),
                              fit: BoxFit.cover,
                            )),
                      );
                    }),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                      tampiliklanList.length,
                      ((index) => Indicator(
                          isActive: gambarterpilih == index ? true : false)))
                ],
              ),
            )
          ],
        ),
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
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final bool isActive;
  const Indicator({Key, key, required this.isActive}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.0,
      width: isActive ? 22.0 : 8.0,
      decoration: BoxDecoration(
          color: isActive ? Colors.red : Colors.grey,
          borderRadius: BorderRadius.circular(8.0)),
    );
  }
}
