// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Showfullnews extends StatelessWidget {
  final String img;
  final String titel;
  final String description;
  final String time;
  final String author;

  const Showfullnews(
      {Key? key,
      required this.img,
      required this.titel,
      required this.description,
      required this.time,
      required this.author})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
    final String apiUrl =
        "https://news-node-app.herokuapp.com/favouritenews/favouritenewsadd";
    Future<List<dynamic>> fetchUsers() async {
      print("=============================================>>>>>>");
      var result = await http.post(Uri.parse(apiUrl), body: {
        "userName": "muzam mukhtar Mukhtar",
        "userEmail": "assi4@gmail.com",
        "id": "Id am fdfdf",
        "name": "Iname am fsdf",
        "author": author,
        "title": titel,
        "description": description,
        "url": "I am urlmuslim",
        "urlToImage": img,
        "publishedAt": time,
        "content": "I am content"
      });
      print(
          "===================Get data form mongodb =============================");
      print(json.decode(result.body));
      // print(json.decode(result.body[0]));
      return json.decode(result.body);
    }

    return MaterialApp(
            debugShowCheckedModeBanner: false,
        home: Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   leading: IconButton(
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //       },
      //       icon: const Icon(
      //         Icons.arrow_back,
      //       )),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: vwidth / 0.2,
              height: vwidth / 1.2,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("${img}"), fit: BoxFit.cover),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: fetchUsers,
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 44,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                titel,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                children: [
                  Text(
                    time,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(width: 2, height: 15, color: Colors.black),
                  ),
                  Text(
                    author,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text(
                description,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
