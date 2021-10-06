// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Favourit extends StatefulWidget {
  const Favourit({Key? key}) : super(key: key);

  @override
  _FavouritState createState() => _FavouritState();
}

final String apiUrl =
    // "https://newsapi.org/v2/everything?q=tesla&from=2021-08-29&sortBy=publishedAt&apiKey=279ff2d9334747f980557d5520f7a04f";
    // Top headlines from TechCrunch right now
    "https://news-node-app.herokuapp.com/auth/signUp";

Future<List<dynamic>> fetchUsers() async {
  var result = await http.post(Uri.parse(apiUrl),
      body: {"email": "mudassirmmukhta4@gmail.com", "password": "qwerty"});
  print("================================================");
  print(json.decode(result.body));
  return json.decode(result.body)["articles"];
}

class _FavouritState extends State<Favourit> {
  @override
  Widget build(BuildContext context) {
    fetchUsers();
    return const MaterialApp(
      home: Scaffold(
        body: Text("Favour Screen"),
      ),
    );
  }
}
