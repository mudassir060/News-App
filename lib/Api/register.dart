import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app/Api/login.dart';
import 'package:news_app/Page/Home.dart';
// // import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:firebase/firebase.dart' as fb;

import 'package:http/http.dart' as http;
import 'dart:convert';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  var UserProfile =
      "https://media.istockphoto.com/vectors/profile-placeholder-image-gray-silhouette-no-photo-vector-id1016744034?b=1&k=6&m=1016744034&s=612x612&w=0&h=dbicqM9p31ex5Lm-FpsdOjHkPZM_6Lmkb02qJO9SY5E=";
  @override
  Widget build(BuildContext context) {
    final TextEditingController usernamecontroller = TextEditingController();
    final TextEditingController useremailcontroller = TextEditingController();
    final TextEditingController phonenocontroller = TextEditingController();
    final TextEditingController biocontroller = TextEditingController();
    final TextEditingController otpcontroller = TextEditingController();
    final TextEditingController userpasswordcontroller =
        TextEditingController();
    String UID = '';
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // print("objectobjectobjectobjectobjectobjectobjectobjectobject");

    void register() async {
      final String username = usernamecontroller.text;
      final String useremail = useremailcontroller.text;
      final String userOTP = otpcontroller.text;
      final String PhoneNo = phonenocontroller.text;
      final String Bio = biocontroller.text;
      final String userpassword = userpasswordcontroller.text;
      try {
        // var res = EmailAuth.validate(
        //     receiverMail: useremailcontroller.text,
        //     userOTP: otpcontroller.text);
        // print(res);
        // if (res) {
        // print("OTP Verified and Log in.....");
        final UserCredential user = await auth.createUserWithEmailAndPassword(
            email: useremailcontroller.text,
            password: userpasswordcontroller.text);
        setState(() {
          UID = user.user!.uid;
        });
        await firestore.collection("users").doc(UID).set({
          "username": username,
          "email": useremail,
          "PhoneNo": PhoneNo,
          "Bio": Bio,
          "password": userpassword,
          "UserProfile": UserProfile,
          "UID": user.user!.uid
        });
        final String apiUrl = "https://news-node-app.herokuapp.com/auth/signUp";
        Future<List<dynamic>> fetchUsers() async {
          var result = await http.post(Uri.parse(apiUrl), body: {
            "email": useremail,
            "password": userpassword,
            "Name": username,
            "phoneNo": PhoneNo,
          });
          print(
              "===================Get data form mongodb =============================");
          print(json.decode(result.body));
                  Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
        );
          // print(json.decode(result.body[0]));
          return json.decode(result.body);
        }

        fetchUsers();
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => Home(),
        //   ),
        // );
        // // } else {
        //   print("Invalid OTP");
        // }
      } catch (e) {
        print("Error ==============>$e");
        Widget okButton = TextButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.of(context).pop(); // dismiss dialog
          },
        );
        AlertDialog alert = AlertDialog(
          title: Center(child: Text("Error")),
          content: Text("$e"),
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
      // print([username, useremail, userpassword]);
    }

    // void sentOTP() async {
    //   EmailAuth.sessionName = "Test Session";
    //   var res = await EmailAuth.sendOtp(receiverMail: useremailcontroller.text);
    //   try {
    //     print("OTP Sent========>$res");
    //   } catch (e) {
    //     print("We could not sent the OTP ======>$e");
    //   }
    // }

    // void verifyOTP() {
    //   var res = EmailAuth.validate(
    //       receiverMail: useremailcontroller.text, userOTP: otpcontroller.text);
    //   if (res) {
    //     print("OTP Verified");
    //   } else {
    //     print("Invalid OTP");
    //   }
    // }

    // void uploadImage({required Function(File file) onSelected}) {
    //   FileUploadInputElement uploadInput = FileUploadInputElement()
    //     ..accept = 'image/*';
    //   uploadInput.click();

    //   uploadInput.onChange.listen((event) {
    //     final file = uploadInput.files!.first;
    //     final reader = FileReader();
    //     reader.readAsDataUrl(file);
    //     reader.onLoadEnd.listen((event) {
    //       onSelected(file);
    //     });
    //   });
    // }

    // void uploadToStorage() async {
    //   final dateTime = DateTime.now();
    //   uploadImage(
    //     onSelected: (file) {
    //       final path = '${dateTime}${file.name}}';

    //       fb
    //           .storage()
    //           // .refFromURL('gs://pk-book.appspot.com/')
    //           .refFromURL('gs://linkedup060.appspot.com')
    //           .child("users")
    //           .child(path)
    //           .put(file)
    //           .future
    //           .then((value) => {
    //                 print("===========>Image uploded"),
    //                 fb
    //                     .storage()
    //                     .refFromURL('gs://linkedup060.appspot.com')
    //                     .child("users")
    //                     .child(path)
    //                     .getDownloadURL()
    //                     .then((value) => {
    //                           setState(() {
    //                             UserProfile = value.toString();
    //                           }),
    //                           print("===================>get link"),
    //                           print(
    //                               "===============Iner===========>$UserProfile")
    //                         })
    //                     .catchError((onError) =>
    //                         {print("Image not upload"), print(onError)})
    //               });
    //     },
    //   );
    // }

    // print("===============Oter===========>$UserProfile");
    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: '/signup',
      title: 'News App',
      home: Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: Text('Welcome to Arya Solutions'),
        // ),
        body: SingleChildScrollView(
          child: Container(
            width: vwidth,
            // height: vhight,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    decoration: new BoxDecoration(
                        color: Colors.black12,
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0),
                          bottomRight: const Radius.circular(40.0),
                          bottomLeft: const Radius.circular(40.0),
                        )),
                    constraints: BoxConstraints(maxWidth: 600),
                    // width: 360,
                    // height: 400,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 15, right: 15),
                        child: Container(
                          child: Column(
                            children: [
                              // SizedBox(height: 30),
                              // Text(
                              //   'Welcome to LinkedUp',
                              //   style: TextStyle(fontWeight: FontWeight.bold),
                              // ),
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

                              const SizedBox(height: 20),
                              // GestureDetector(
                              //   onTap: () {
                              //     uploadToStorage();
                              //   },
                              //   child: Container(
                              //     height: 100,
                              //     width: 100,
                              //     decoration: BoxDecoration(
                              //       image: DecorationImage(
                              //           image: NetworkImage("${UserProfile}"),
                              //           fit: BoxFit.cover),
                              //       shape: BoxShape.circle,
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(height: 20),

                              TextField(
                                controller: usernamecontroller,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Username",
                                  labelText: "User Name",
                                ),
                              ),
                              SizedBox(height: 15),
                              TextField(
                                controller: useremailcontroller,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Email",
                                  labelText: "Email",
                                  // suffixIcon: Padding(
                                  //   padding: const EdgeInsets.only(right: 12),
                                  //   child: TextButton(
                                  //     child: Text("Sent OTP"),
                                  //     onPressed: () => sentOTP(),
                                  //   ),
                                  // ),
                                ),
                              ),

                              // SizedBox(height: 15),
                              // TextField(
                              //   controller: otpcontroller,
                              //   decoration: InputDecoration(
                              //     border: OutlineInputBorder(),
                              //     hintText: "Enter OTP",
                              //     labelText: "Enter OTP",
                              //     suffixIcon: TextButton(
                              //       child: Text("Verify OTP"),
                              //       onPressed: () => verifyOTP(),
                              //     ),
                              //   ),
                              // ),

                              SizedBox(height: 15),
                              TextField(
                                controller: phonenocontroller,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Phone Number",
                                    labelText: "Phone Number"),
                              ),
                              // IntlPhoneField(
                              //   decoration: InputDecoration(
                              //     labelText: 'Phone Number',
                              //     border: OutlineInputBorder(
                              //       borderSide: BorderSide(),
                              //     ),
                              //   ),
                              //   initialCountryCode: 'IN',
                              //   onChanged: (phone) {
                              //     print(phone.completeNumber);
                              //   },
                              // ),
                              SizedBox(height: 15),
                              TextField(
                                controller: userpasswordcontroller,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Password"),
                              ),
                              // FlutterPasswordStrength(
                              //     password: userpasswordcontroller.text,
                              //     strengthCallback: (strength) {
                              //       debugPrint(strength.toString());
                              //     }),

                              SizedBox(height: 15),
                              TextField(
                                controller: biocontroller,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "About",
                                    labelText: "About"),
                              ),
                              SizedBox(height: 10),
                              FlatButton(
                                onPressed: register,
                                child: Text(
                                  'Registration',
                                  // style: TextStyle(fontSize: 10.0),
                                ),
                                color: Colors.blueAccent,
                                textColor: Colors.white,
                              ),
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
                              // SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Login(),
                                          ),
                                        );
                                        // Navigator.pushNamed(context, '/');
                                      },
                                      child: const Text(
                                        "I have an account? Login",
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  const SizedBox(height: 50),
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
