import 'package:flutter/material.dart';
import 'package:flutter_assignment/src/pages/home_page.dart';
import 'package:flutter_assignment/src/providers/home_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Assignment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor:
              Colors.blue, // Set your desired app bar background color
        ),
      ),
      home: ChangeNotifierProvider(
        create: (_) => HomeProvider(),
        child: const HomePage(),
      ),
    );
  }
}
