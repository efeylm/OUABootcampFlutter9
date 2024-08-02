import 'package:flutter/material.dart';

class FileAddPage extends StatefulWidget {
  const FileAddPage({super.key});

  @override
  State<FileAddPage> createState() => _FileAddPageState();
}

class _FileAddPageState extends State<FileAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE6E4BB),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [IconButton(icon: const Icon(Icons.person), onPressed: () {})],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Dosya Ekleme İşlemini\nEkibimiz Yapmaktadır\ndosya@kagitsiz.com\nMailine PDF Dosyanızı\nGöndererek Eklenmesini Talep\nEdebilirsiniz",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontFamily: "Roboto",
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
