import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app/Api/register.dart';
import 'package:news_app/widget/Navigation.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String Name = '';
  String Email = '';
  String PhoneNo = '';
  String Bio = '';
  String UID = '';
  String UserProfile = '';

  final TextEditingController useremailcontroller = TextEditingController();
  final TextEditingController userpasswordcontroller = TextEditingController();

  void register() async {
    Map? UserData = {};
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // print("objectobjectobjectobjectobjectobjectobjectobjectobject");
    // final String useremail = useremailcontroller.text;
    // final String userpassword = userpasswordcontroller.text;
    const String useremail = 'pak@gmail.com';
    const String userpassword = 'qwerty';
    try {
      final UserCredential user = await auth.signInWithEmailAndPassword(
          email: useremail, password: userpassword);
      // final DocumentSnapshot snapshot =
      //     await firestore.collection("users").doc(user.user!.uid).get();
      // final data = snapshot.data();
      // setState(() {
      //   UserData = data as Map?;
      //   UserData!['provider'] = 'Email';
      // });
      print(
          '=========================User is Login...=============================');
      final String apiUrl = "https://news-node-app.herokuapp.com/auth/signin";

      Future<List<dynamic>> fetchUsers() async {
        var result = await http.post(Uri.parse(apiUrl), body: {
          "email": "mudassirmmukhta4@gmail.com",
          "password": "qwerty"
        });
        print(
            "===================Get data form mongodb =============================");
        print(json.decode(result.body));
        return json.decode(result.body);
      }

      fetchUsers();
      // print("Name =====> ${UserData["username"]}");
      // print("Email =====> ${UserData["email"]}");
      // print("Provider =====> ${UserData["provider"]}");
      // print("Phone No =====> ${UserData["PhoneNo"]}");
      // print("Bio =====> ${UserData["Bio"]}");
      // setState(() {
      //   Name = UserData!["username"];
      //   Email = UserData!["email"];
      //   PhoneNo = UserData!["PhoneNo"];
      //   UserProfile = UserData!["UserProfile"];
      //   Bio = UserData!["Bio"];
      //   UID = UserData!["UID"];
      // });
      // print({Name, Email, PhoneNo, "pic", UserProfile});
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => PKBook(
      //       Name: Name,
      //       Email: Email,
      //       PhoneNo: PhoneNo,
      //     ),
      //   ),
      // );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
              Name: Name,
              Email: Email,
              PhoneNo: PhoneNo,
              Bio: Bio,
              UID: UID,
              UserProfile: UserProfile),
        ),
      );

      // ++++++++++++++++++++faile++++++++++++++++++++
      // Navigator.pushReplacementNamed(context, '/Home', arguments: {
      //   'Name': UserData["username"],
      //   'Email': UserData["email"],
      //   'provider': UserData["provider"],
      //   'PhoneNo': UserData["PhoneNo"],
      // });
      // // print([username, useremail, userpassword]);

    } catch (e) {
      print("Error ==============>$e");
      Widget okButton = TextButton(
        child: const Text("OK"),
        onPressed: () {
          Navigator.of(context).pop(); // dismiss dialog
        },
      );
      AlertDialog alert = AlertDialog(
        title: const Center(child: Text("Error")),
        content: Text(e.toString()),
        actions: [
          okButton,
        ],
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => Home(),
    //   ),
    // );
    // Navigator.pushReplacementNamed(context, '/Home',arguments:{
    //   'UserData' :
    // });
    // print([username, useremail, userpassword]);
  }

  // Initially password is obscure
  bool _obscureText = true;
  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initstate() {
    super.initState();
    register();
  }

  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      home: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: vwidth,
            height: vhight,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0),
                          bottomLeft: Radius.circular(40.0),
                        )),
                    // constraints: BoxConstraints(minWidth: 100, maxWidth: 600),
                    constraints: BoxConstraints(maxWidth: 600),
                    // width: 360,
                    // height: 400,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 15, right: 15),
                        child: Container(
                          // width: 300,
                          child: Column(
                            children: [
                              SizedBox(height: 30),
// ++++++++++++++++++++++++++++++++++++++++Welcome to LinkedUp++++++++++++++++++++++++++++++++++++++++++++++++++++++

                              // Text(
                              //   'Welcome to Linked-Up',
                              //   style: TextStyle(fontWeight: FontWeight.bold),
                              // ),
                              // SizedBox(height: 10),
// +++++++++++++++++++++++++++++++++++++++Logo Image+++++++++++++++++++++++++++++++++++++++++++++++++++++++
                              Container(
                                height: 150,
                                width: 220,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage('images/Logo.png'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                              SizedBox(height: 30),
                              // // // // // // // // // // Email input // // // // // // // // //
                              TextField(
                                controller: useremailcontroller,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Email',
                                    hintText: "Email"),
                              ),
                              SizedBox(height: 15),
                              TextField(
                                controller: userpasswordcontroller,
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Password',
                                  hintText: "Password",
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      _obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      // color: Theme.of(context).primaryColorDark,
                                    ),
                                    onPressed: () {
                                      print(
                                          "===================================================$_obscureText");
                                      _toggle();
                                      print(
                                          "===================================================$_obscureText");
                                    },
                                  ),
                                ),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Forget Password',
                                        style: TextStyle(fontSize: 10.0),
                                      )),
                                ],
                              ),
                              // SizedBox(height: 10),
                              FlatButton(
                                child: const Text(
                                  'LogIn',
                                  // style: TextStyle(fontSize: 10.0),
                                ),
                                color: Colors.blueAccent,
                                textColor: Colors.white,
                                onPressed: register,
                              ),
                              SizedBox(height: 20),
                              // SignInButton(
                              //   Buttons.Google,
                              //   onPressed: () {
                              //     signInWithGoogle(context);
                              //   },
                              // ),
                              // SignInButton(
                              //   Buttons.Facebook,
                              //   onPressed: () {
                              //     facebook_auth(context);
                              //   },
                              // ),
                              // SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Registration(),
                                          ),
                                        );
                                        // Navigator.pushNamed(
                                        //     context, '/Registration');
                                      },
                                      child: Text(
                                        "Don't have an account? Sign up",
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  SizedBox(height: 50),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
