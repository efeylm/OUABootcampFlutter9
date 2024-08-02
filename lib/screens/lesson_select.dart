import 'package:bootcampdeneme/screens/file_add.dart';
import 'package:bootcampdeneme/screens/list_file.dart';
import 'package:bootcampdeneme/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';
import 'package:bootcampdeneme/universities.dart';
import 'package:bootcampdeneme/lessons_and_notes.dart';

class LessonSelectPage extends StatefulWidget {
  final University university;

  const LessonSelectPage({super.key, required this.university});

  @override
  _LessonSelectPageState createState() => _LessonSelectPageState();
}

class _LessonSelectPageState extends State<LessonSelectPage> {
  final TextEditingController _lessonController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  Lesson? selectedLesson;
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
          IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              })
        ], // Placeholder icon for logo
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                widget.university.logo,
                height: 200,
                width: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Notlarını Aradığın\nDersin Kodunu Seç: ${widget.university.name}",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontFamily: "Roboto", fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, right: 40, left: 40),
                child: Container(
                  height: 300, // Adjust the height as needed
                  child: Column(
                    children: [
                      SearchField<Lesson>(
                        controller: _lessonController,
                        focusNode: _focusNode,
                        suggestions: widget.university.lessons
                            .map(
                              (e) => SearchFieldListItem<Lesson>(
                                e.code,
                                item: e,
                                // Use child to show Custom Widgets in the suggestions
                                // defaults to Text widget
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(e.code),
                                      SizedBox(width: 10),
                                      Text(e.name),
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        onSuggestionTap: (SearchFieldListItem<Lesson> item) {
                          setState(() {
                            selectedLesson = item.item;
                          });
                          // Unfocus the text field to close the suggestion list
                          _focusNode.unfocus();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 40, right: 40, left: 40),
                child: ElevatedButton(
                  onPressed: () {
                    print(_lessonController.text);
                    if (selectedLesson != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListFilePage(
                            lesson: selectedLesson!,
                          ),
                        ),
                      );
                    } else {
                      print("No lesson selected");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromHeight(50),
                      backgroundColor: Color.fromARGB(223, 85, 52, 9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: Text(
                    "Ders Kodunu Seç",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ],
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
