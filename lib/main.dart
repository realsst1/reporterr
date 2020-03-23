import 'package:flutter/material.dart';
import 'package:reporterr/screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reporterr',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Reporterr"),
          centerTitle: true,
        ),
        //resizeToAvoidBottomPadding: false,
        body: HomePage(),
      )
    );
  }
}


