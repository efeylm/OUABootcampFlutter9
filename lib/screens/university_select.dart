import 'package:bootcampdeneme/screens/file_add.dart';
import 'package:bootcampdeneme/screens/lesson_select.dart';
import 'package:bootcampdeneme/screens/profile.dart';
import 'package:bootcampdeneme/universities.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

class UniversitySelectPage extends StatefulWidget {
  const UniversitySelectPage({super.key});

  @override
  _UniversitySelectPageState createState() => _UniversitySelectPageState();
}

class _UniversitySelectPageState extends State<UniversitySelectPage> {
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
        leading: Image.asset("lib/images/logo.png"),
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Notlarına Ulaşmak İstediğin\nÜniversiteyi Seç",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontFamily: "Roboto",
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, right: 40, left: 40),
                child: SearchField<University>(
                  controller: _universityController,
                  focusNode: _focusNode,
                  suggestions: universities
                      .map(
                        (e) => SearchFieldListItem<University>(
                          e.name,
                          item: e,
                          // Use child to show Custom Widgets in the suggestions
                          // defaults to Text widget
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(e.logo),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(e.name),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onSuggestionTap: (SearchFieldListItem<University> item) {
                    setState(() {
                      selectedUniversity = item.item;
                    });
                    // Unfocus the text field to close the suggestion list
                    _focusNode.unfocus();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, right: 40, left: 40),
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedUniversity != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LessonSelectPage(
                            university: selectedUniversity!,
                          ),
                        ),
                      );
                    } else {
                      print("No university selected");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromHeight(50),
                      backgroundColor: Color.fromARGB(223, 85, 52, 9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: Text(
                    "Üniversiteyi Seç",
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
