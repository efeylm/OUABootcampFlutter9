// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bootcampdeneme/screens/file_add.dart';
import 'package:bootcampdeneme/screens/lesson_select.dart';
import 'package:bootcampdeneme/universities.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _universityController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  University? selectedUniversity;

  int _selectedIndex = 0; // Seçilen BottomNavigationBar öğesinin indeksi

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FileAddPage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FileAddPage()),
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE6E4BB),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(icon: const Icon(Icons.person), onPressed: () {})
        ], // Placeholder icon for logo
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 56.0),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(70.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Profil',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Text('Cemil Cemel',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Yıldız Teknik Üniversitesi',
                      style: TextStyle(fontSize: 16)),
                  Text('Üniversite',
                      style: TextStyle(color: Colors.grey, fontSize: 14)),
                  SizedBox(height: 12),
                  Text('Makine Mühendisliği', style: TextStyle(fontSize: 16)),
                  Text('Bölüm',
                      style: TextStyle(color: Colors.grey, fontSize: 14)),
                  SizedBox(height: 20),
                  Text('Sıkça sorulan sorular',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Akılındaki sorulara çözüm',
                      style: TextStyle(color: Colors.grey, fontSize: 14)),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFE6E4BB),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Dosya Ekle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Kaydedilenler',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
