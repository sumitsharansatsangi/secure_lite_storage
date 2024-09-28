import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:secure_lite_storage/secure_lite_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = SecureLiteStorage();
  await storage.init();

  runApp(MyApp(storage: storage));
}

class MyApp extends StatefulWidget {
  final SecureLiteStorage storage;
  const MyApp({super.key, required this.storage});
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  late final SecureLiteStorage storage;
  @override
  void initState() {
    super.initState();
    storage = widget.storage;
  }

  @override
  Widget build(BuildContext context) {
    final files = storage.getBytesList('files');
    final profilePic = storage.getBytes('profilePicture');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Secure Lite Storage Example'),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
          children: [
            if (profilePic != null && profilePic.isNotEmpty)
              Image.memory(Uint8List.fromList(profilePic)),
            Text("Message: ${storage.get('message') ?? 'No data'}"),
            Text(
                "Username: ${storage.getString('username') ?? 'No Data'}"), // Output: john_doe
            Text("Age: ${storage.getInt('age')}"), // Output: 30
            Text("Height: ${storage.getDouble('height')}"), // Output: 5.9
            Text("IsAdmin: ${storage.getBool('isAdmin')}"), // Output: true
            Text(
                "Tags: ${storage.getStringList('tags') ?? [].join(',')}"), // Output: [dart, flutter]
            Text(
                "Scores: ${storage.getIntList('scores') ?? [].join(',')}"), // Output: [100, 95, 85]
            Text(
                "Strike Rate: ${storage.getDoubleList('strike_rate')}"), // Output: [36.6, 37.0, 36.8]
            Text(
                "Attendence: ${storage.getBoolList('attendence')}"), // Output: [true, false, true]
            if (files != null)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (final file in files)
                    Image.memory(Uint8List.fromList(file)),
                ],
              ),
          ],
        )),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: writeData,
          icon: Icon(Icons.add),
          label: Text("Add Data"),
        ),
      ),
    );
  }

  Future<void> writeData() async {
    storage.set('message', 'Secure Lite Storage is the Best!! 🎸🤘');
    storage.setString('username', 'john_doe');
    storage.setInt('age', 30);
    storage.setDouble('height', 5.9);
    storage.setBool('isAdmin', true);
    storage.setBytes(
        'profilePicture', File('assets/profile.jpeg').readAsBytesSync());
    storage.setStringList('tags', ['dart', 'flutter']);
    storage.setIntList('scores', [100, 95, 85]);
    storage.setDoubleList('strike_rate', [36.6, 37.0, 36.8]);
    storage.setBoolList('attendence', [true, false, true]);
    storage.setBytesList('files', [
      File('assets/file1.jpeg').readAsBytesSync(),
      File('assets/logo.jpeg').readAsBytesSync(),
      File('assets/file2.jpeg').readAsBytesSync()
    ]);
    setState(() {});
  }
}
