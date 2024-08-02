import 'dart:io';

import 'package:bootcampdeneme/api/pdf_api.dart';
import 'package:bootcampdeneme/lessons_and_notes.dart';
import 'package:bootcampdeneme/screens/file_add.dart';
import 'package:bootcampdeneme/screens/pdf_viewer_page.dart';
import 'package:bootcampdeneme/screens/profile.dart';
import 'package:bootcampdeneme/screens/saved_notes.dart';
import 'package:bootcampdeneme/universities.dart';
import 'package:flutter/material.dart';

class FileDetailPage extends StatefulWidget {
  const FileDetailPage({super.key, required this.paper, required this.lesson});
  final Paper paper;
  final Lesson lesson;
  @override
  State<FileDetailPage> createState() => _FileDetailPageState();
}

class _FileDetailPageState extends State<FileDetailPage> {
  int starCount = 999;
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
          MaterialPageRoute(
            builder: (context) => SavedNotesPage(
              savedNotes: savedNotes,
            ),
          ),
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
          IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16),
              child: Text(
                "İçerik",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontFamily: "Roboto",
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
                  child: Container(
                    height: 80,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      widget.paper.content,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontFamily: "Roboto",
                          ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16),
              child: Text(
                "Öğretim Görevlisi",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontFamily: "Roboto",
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
                  child: Container(
                    height: 40,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      widget.paper.tutor,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontFamily: "Roboto",
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16),
              child: Text(
                "Ders Kodu",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontFamily: "Roboto",
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
                  child: Container(
                    height: 40,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "BLM-4002",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontFamily: "Roboto",
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16),
              child: Text(
                "Yükleme Tarihi",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontFamily: "Roboto",
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
                  child: Container(
                    height: 40,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      widget.paper.date,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontFamily: "Roboto",
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.star, color: Colors.black),
                    onPressed: () {
                      setState(() {
                        starCount++;
                      });
                    },
                  ),
                  Text("$starCount"),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.bookmark_border_outlined,
                        color: Colors.black),
                    onPressed: () {
                      // Kaydet ikonu tıklama işlevi
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, right: 40, left: 40),
              child: Center(
                child: ElevatedButton(
                  onPressed: () async {
                    final url =
                        //'https://people.math.wisc.edu/~angenent/Free-Lecture-Notes/free221.pdf';
                        widget.paper.pdfUri;
                    final file = await PDFApi.loadNetwork(url);
                    openPDF(context, file);
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromHeight(50),
                      backgroundColor: Colors.black87,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: Text(
                    "PDF Görüntüle",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ),
          ],
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

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
      );
}
