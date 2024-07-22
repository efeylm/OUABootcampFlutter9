import 'package:bootcampdeneme/screens/home.dart';
import 'package:bootcampdeneme/screens/login.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE6E4BB),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginPage()));
          },
        ),
        actions: [Icon(Icons.star_border_purple500_outlined)], //LOGO

        // Placeholder icon for logo
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Hoş Geldin\nHemen Kaydını Oluştur\nDers Arşivlerine Ulaş",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontFamily: "Roboto",
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(top: 8, bottom: 8, right: 40, left: 40),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Ad",
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 162, 122, 107),
                              width: 2))),
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(top: 8, bottom: 8, right: 40, left: 40),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Soyad",
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 162, 122, 107),
                              width: 2))),
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(top: 8, bottom: 8, right: 40, left: 40),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "E-posta",
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 162, 122, 107),
                              width: 2))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, right: 40, left: 40),
                child: TextField(
                  obscureText: _isObscured,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscured = !_isObscured;
                            });
                          },
                          icon: Icon(_isObscured
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      labelText: "Parola",
                      border: const OutlineInputBorder(),
                      labelStyle: const TextStyle(color: Colors.black54),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 162, 122, 107),
                              width: 2))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, right: 40, left: 40),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HomePage()));
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromHeight(50),
                      backgroundColor: Colors.black87,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: Text(
                    "Register",
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
    );
  }
}
