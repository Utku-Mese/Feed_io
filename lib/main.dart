import 'package:feed_io/utils/constants.dart';
import 'package:feed_io/views/my_page_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feed.IO',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
        useMaterial3: true,
      ),
      /* initialRoute: "/", // default is "/"
      routes: {
        "/": (context) => const HomeScreen(),
      }, */
      home: const MyPageView(),
    );
  }
}
