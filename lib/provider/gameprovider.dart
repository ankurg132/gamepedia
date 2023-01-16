import 'dart:convert';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter/material.dart';
import 'package:gamepedia/models/gamedata.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class GameProvider with ChangeNotifier {
  List<GameData> gdata = [];
  // List<Results> results = [];

  Future getBooks() async {
    final response =
        await http.get(Uri.parse('https://www.freetogame.com/api/games'));
    if (response.statusCode == 200) {
      gdata.clear();
      // print(Character.decode(response.body));
      List gameData = jsonDecode(response.body);
      // loop over gameData objects
      gameData.forEach((element) => gdata.add(GameData.fromJson(element)));
      print("LEN:" + gdata.length.toString());
      notifyListeners();
    } else {
      throw Exception('Failed to load album');
    }
    FlutterNativeSplash.remove();
  }
}
