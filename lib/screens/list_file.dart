import 'package:bootcampdeneme/lessons_and_notes.dart';
import 'package:bootcampdeneme/screens/file_add.dart';
import 'package:bootcampdeneme/screens/file_detail.dart';
import 'package:bootcampdeneme/screens/profile.dart';
import 'package:bootcampdeneme/screens/saved_notes.dart';
import 'package:bootcampdeneme/universities.dart';
import 'package:flutter/material.dart';

class ListFilePage extends StatefulWidget {
  const ListFilePage({super.key, required this.lesson});
  final Lesson lesson;

  @override
  State<ListFilePage> createState() => _ListFilePageState();
}

class _ListFilePageState extends State<ListFilePage> {
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
          MaterialPageRoute(
            builder: (context) => SavedNotesPage(savedNotes: savedNotes),
          ),
        );
        break;
    }
  }

  void _toggleSave(Note note) {
    setState(() {
      if (savedNotes.contains(note)) {
        savedNotes.remove(note);
      } else {
        savedNotes.add(note);
      }
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
            Navigator.pop(context);
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.lesson.code + " Ders Kodunda Bulunan Notlar",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontFamily: "Roboto",
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          // Generate CustomListItem for each note
          ...widget.lesson.notes.map((note) {
            bool isSaved = savedNotes.contains(note);
            return CustomListItem(
              title: note.name,
              subtitle: note.code,
              isSaved: isSaved,
              onItemPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FileDetailPage(
                        lesson: widget.lesson, paper: note.paper),
                  ),
                );
              },
              onStarPressed: () {
                // Define what happens when star icon is pressed
              },
              onSavePressed: () {
                _toggleSave(note);
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

class CustomListItem extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool isSaved;
  final VoidCallback onItemPressed; // Callback for the entire item
  final VoidCallback onStarPressed;
  final VoidCallback onSavePressed;

  CustomListItem({
    required this.title,
    required this.subtitle,
    required this.onItemPressed,
    required this.onStarPressed,
    required this.onSavePressed,
    this.isSaved = false,
  });

  @override
  State<CustomListItem> createState() => _CustomListItemState();
}

class _CustomListItemState extends State<CustomListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onItemPressed, // Triggered when the item is tapped
      child: ListTile(
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(widget.subtitle),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.star_border_outlined, color: Colors.black),
              onPressed: widget.onStarPressed,
            ),
            IconButton(
              icon: Icon(
                widget.isSaved
                    ? Icons.bookmark
                    : Icons.bookmark_border_outlined,
                color: Colors.black,
              ),
              onPressed: widget.onSavePressed,
            ),
          ],
        ),
      ),
    );
  }
}
