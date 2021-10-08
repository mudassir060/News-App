// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:news_app/Api/login.dart';


class NotSigin extends StatelessWidget {
  const NotSigin({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  const Text(
                    "Login first",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    child: const Text(
                      'LogIn',
                      style: TextStyle(fontSize: 30.0),
                    ),
                    onPressed: (){ Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Login(),
                                    ),
                                  );},
                  ),
                ],
              ),);
  }
}