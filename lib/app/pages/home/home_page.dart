import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State <HomePage> createState() => HomePageState();
}

class HomePageState extends State <HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final sp = await SharedPreferences.getInstance();
            sp.clear();
            Navigator.of(context).pushNamedAndRemoveUntil("/", (route) => false);
          },
          child: Text("Logout"),
        ),
      ),
    );
  }
}