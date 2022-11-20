import 'package:citranet/Controller/APIController.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

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
  var dataUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
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
          )
        ],
      ),
    ));
  }
}
