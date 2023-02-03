import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'HiveDatabase/hiveDataBase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directry = await getApplicationDocumentsDirectory();// Create Directory using path provider
  Hive.init(directry.path);// For initialize the directory

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
