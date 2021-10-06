// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:news_app/Api/login.dart';

class Logout extends StatefulWidget {
  const Logout({ Key? key }) : super(key: key);

  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
    Logout() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Login(),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    Logout();
    return const Text("Logout");
  }
}