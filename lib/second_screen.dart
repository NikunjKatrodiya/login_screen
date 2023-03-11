import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String email = "";
  String password = "";
  String image = "";
  SharedPreferences? sharedPreferences;
  @override
  void initState() {
    // TODO: implement initState
    getInstanceData();
    super.initState();
  }

  getInstanceData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    getData();
  }

  getData() {
    if (sharedPreferences!.containsKey('loginData')) {
      dynamic data = jsonDecode(sharedPreferences!.getString('loginData')!);

      email = data["email"];
      password = data["password"];
      image = data["image"];
    } else {
      debugPrint('false');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.file(
            File(image),
            height: 300,
            width: 300,
          ),
          Text(
            "email: $email",
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "pass: $password",
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
