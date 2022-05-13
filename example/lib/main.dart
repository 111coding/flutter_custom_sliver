import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_sliver/flutter_custom_sliver.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: const ClampingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) => [
          /*
           * =============== sliver begin ===============
           */
          CustomSliverAppBar(
            appBar: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(children: const [Icon(Icons.arrow_back_ios)]),
            ),
            appBarBackgroundColor: Colors.white,
            expandedSpace: Image.asset(
              "assets/flutter-logo.jpg",
              fit: BoxFit.fitHeight,
            ),
            openedSystemUiOverlayStyle: SystemUiOverlayStyle.light,
            closedSystemUiOverlayStyle: SystemUiOverlayStyle.dark,
          ),
          /*
           * =============== sliver end ===============
           */
        ],
        body: ListView.builder(
          physics: const ClampingScrollPhysics(),
          itemCount: 200,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text("$index"),
            );
          },
        ),
      ),
    );
  }
}
