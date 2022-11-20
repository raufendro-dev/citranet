import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class API {
  static login(username, password) async {
    final uri = Uri.parse(
        'http://raufendro-dev.com:1998/username=$username&password=$password');
    var response = await http.get(uri);
    var responsedata = json.decode(response.body);
    if (responsedata.isNotEmpty) {
      if (responsedata[0]['username'] == username &&
          responsedata[0]['password'] == password &&
          responsedata[0]['status'] == 'ACT') {
        var hasil = Usersimpan(
            id: responsedata[0]['id'],
            nama: responsedata[0]['nama'],
            username: responsedata[0]['username'],
            password: responsedata[0]['password'],
            pelangganid: responsedata[0]['pelangganid'],
            gambar: responsedata[0]['gambar'].toString().replaceAll('\/', '/'),
            status: responsedata[0]['status']);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('user', hasil.username);
        prefs.setString('password', hasil.password);
        return hasil;
      }
    } else {
      return 'dilarang';
    }
  }
}
