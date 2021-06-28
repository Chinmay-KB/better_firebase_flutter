import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_easyaccess/home.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    home: Home(),
  ));
}
