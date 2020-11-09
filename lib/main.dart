import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:latihan_simpan_json/list_user.dart';
import 'package:latihan_simpan_json/models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Load Local JSON File"),
      ),
      body: Container(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('assets/user.json'),
          builder: (context, snapshot) {
            List<User> user = parseJson(snapshot.data.toString());

            if (snapshot.hasData) {
              return ListUser(user);
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  List<User> parseJson(String response) {
    if (response == null) {
      return [];
    }
    final parsed =
        json.decode(response.toString()).cast<Map<String, dynamic>>();

    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }
}
