import 'package:flutter/material.dart';
import 'package:pinetwork/UI/contactlist/contactlistpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactsListPage(), // 🔹 Moved outside ThemeData
    );
  }
}

