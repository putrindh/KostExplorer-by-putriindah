import 'package:flutter/material.dart';
import 'package:kosku/mahasiswa/mahasiswa_page.dart';
import 'package:kosku/screens/datas/datas_screen.dart';
// ignore: unused_import

import 'screen/login_screen.dart'; // Import halaman login

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
      ),
      // Tentukan halaman awal aplikasi sebagai halaman login
      home: Login(), // Mengarahkan ke halaman login
      routes: {
        '/mahasiswa-screen': (context) => const MahasiswaScreen(),
        '/datas-screen': (context) => const DatasScreen(),
      }
    );
  }
}
