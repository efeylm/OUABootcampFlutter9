import 'package:bootcampdeneme/lessons_and_notes.dart';
import 'package:bootcampdeneme/screens/file_add.dart';
import 'package:bootcampdeneme/screens/file_detail.dart';
import 'package:bootcampdeneme/screens/list_file.dart';
import 'package:bootcampdeneme/universities.dart';
import 'package:flutter/material.dart';

class SavedNotesPage extends StatefulWidget {
  const SavedNotesPage({super.key, required this.savedNotes});
  final List<Note> savedNotes;

  @override
  State<SavedNotesPage> createState() => _SavedNotesPageState();
}

class _SavedNotesPageState extends State<SavedNotesPage> {
  int _selectedIndex = 0; // Seçilen BottomNavigationBar öğesinin indeksi

  void _onItemTapped(int index) {
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

  void _removeNoteFromSaved(Note note) {
    setState(() {
      savedNotes.remove(note);
    });
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Kaydedilen Notlar",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontFamily: "Roboto",
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          // Generate CustomListItem for each note
          ...widget.savedNotes.map((note) {
            return CustomListItem(
              title: note.name,
              subtitle: note.code,
              isSaved: true,
              onItemPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FileDetailPage(
                      paper: note.paper,
                      lesson: Lesson(name: "name", code: "code", notes: []),
                    ),
                  ),
                );
              },
              onStarPressed: () {
                // Define what happens when star icon is pressed
              },
              onSavePressed: () {
                _removeNoteFromSaved(note);
              },
            );
          }).toList(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFE6E4BB),
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
