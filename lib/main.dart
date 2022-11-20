import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:page_transition/page_transition.dart';
import 'Screen/LoginScreen.dart';
import 'Controller/APIController.dart';
import 'Screen/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Citranet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  cek() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 5));
    if (prefs.getString('user') == null &&
        prefs.getString('password') == null) {
      Navigator.push(context,
          PageTransition(type: PageTransitionType.fade, child: LoginScreen()));
    } else {
      var pindah =
          await API.login(prefs.getString('user'), prefs.getString('password'));
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: HomeScreen(
                variabel: pindah,
              )));
    }
  }

  @override
  void initState() {
    cek();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/image/citranet.png'),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: LoadingAnimationWidget.stretchedDots(
                color: Colors.grey,
                size: 80,
              ),
            )
          ],
        ),
      ),
    );
  }
}
