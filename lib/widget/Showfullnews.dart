// ignore_for_file: file_names

import 'package:flutter/material.dart';

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

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
            )),
      ),
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
