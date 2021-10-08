import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:news_app/Api/login.dart';
import 'package:news_app/Page/Favourit.dart';
import 'package:news_app/Page/SplashScreen.dart';
import 'package:news_app/widget/Navigation.dart';
import 'Page/Home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return const MaterialApp(home: Center(child: Text("error")));
        }
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: SplashScreen(),
            ),
          );
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(
            home: Scaffold(
                body: Center(
          child: LoadingFadingLine.circle(),
        )));
      },
    );
  }
}
