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

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final username = TextEditingController();
  final password = TextEditingController();
  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 2, right: 5),
            child: LoadingAnimationWidget.twoRotatingArc(
              color: Colors.red,
              size: 20,
            ),
          ),
          Container(margin: EdgeInsets.only(left: 7), child: Text("Login")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/image/background.png'),
              fit: BoxFit.cover)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/image/citranet.png'),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Stack(
                children: [
                  SafeArea(
                      child: Center(
                    child: Container(
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                            textAlign: TextAlign.center,
                            controller: username,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Username')),
                        width: 283,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(220, 220, 220, 220))),
                  )),
                ],
              ),
            ),
            Stack(
              children: [
                SafeArea(
                    child: Center(
                  child: Container(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                          textAlign: TextAlign.center,
                          controller: password,
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: 'Password')),
                      width: 283,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(220, 220, 220, 220))),
                )),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: SizedBox(
                width: 200,
                height: 40,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFff0000)),
                    onPressed: () async {
                      showLoaderDialog(context);
                      var pindah =
                          await API.login(username.text, password.text);
                      if (pindah != 'dilarang') {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: HomeScreen(
                                  variabel: pindah,
                                )));
                      } else {
                        Navigator.pop(context);
                        CoolAlert.show(
                          context: context,
                          type: CoolAlertType.error,
                          title: 'Gagal Login',
                          text: 'Username atau Password salah',
                          loopAnimation: false,
                          confirmBtnText: 'Coba Lagi',
                        );
                      }
                    },
                    child: Text("Login")),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
