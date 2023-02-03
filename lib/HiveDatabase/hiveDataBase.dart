// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hive Database")),
      body: Column(
        children: [
          FutureBuilder(
              future: Hive.openBox("Student Data"),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Card(
                      child: ListTile(
                    title: Text(snapshot.data!.get("name").toString()),
                    subtitle: Text(
                        snapshot.data!.get("Details")["Gender"].toString()),
                    trailing: IconButton(
                      onPressed: () {
                        snapshot.data!
                            .put("name", "kiran")
                            .toString(); // Replace name aqsa to kiran
                        // snapshot.data!.delete("name").toString();
                        setState(() {});
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  ));
                }
                return const Text("Null");
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var box = await Hive.openBox(
              "Student Data"); // create file and the file name is Student Data
          box.put("name", "Aqsa"); // store/Put/Add the data in file
          print(box.get("name")); // get the data from file
          box.put("Details", {"Gender": "Female", "Profession": "Developer"});// store data like object
          print(box.get("Details")["Gender"]);
          print(box.get("name")); // get the data from file
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
