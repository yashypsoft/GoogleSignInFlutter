import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gsignin/main.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool isLoading = false;


  Future<Null> handleSignout() async{
    setState(() {
     isLoading = true; 
    });
    await FirebaseAuth.instance.signOut();
    await _googleSignIn.disconnect();
    await _googleSignIn.signOut();

    setState(() {
     isLoading = false; 
    });

    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MyApp()), (Route<dynamic> route)=>false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Signout"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             // Text(name),
              RaisedButton(
                onPressed: handleSignout,
                child: Text("Sign Out", style: TextStyle(color: Colors.white),
                ),
                padding: const EdgeInsets.all(20.0),
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}