// ignore_for_file: prefer_const_constructors

import 'package:bootcampdeneme/auth.dart';
import 'package:bootcampdeneme/screens/home.dart';
import 'package:bootcampdeneme/screens/login.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController =
      TextEditingController();

  AuthService _authService = AuthService();

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
              Padding(
                padding:
                    EdgeInsets.only(top: 8, bottom: 8, right: 40, left: 40),
                child: TextField(
                  controller: _nameController,
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
              Padding(
                padding:
                    EdgeInsets.only(top: 8, bottom: 8, right: 40, left: 40),
                child: TextField(
                  controller: _surnameController,
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
              Padding(
                padding:
                    EdgeInsets.only(top: 8, bottom: 8, right: 40, left: 40),
                child: TextField(
                  controller: _emailController,
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
                  controller: _passwordController,
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
                    if (_nameController.text.isEmpty ||
                        _emailController.text.isEmpty ||
                        _passwordController.text.isEmpty) {
                      final snackBar = SnackBar(
                        content: const Text(
                            'Alanlardan en az birini boş bıraktınız !'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      _authService.createPerson(_nameController.text,
                          _emailController.text, _passwordController.text);
                      final snackBar = SnackBar(
                        content: const Text('Kayıt olundu!'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Future.delayed(Duration(milliseconds: 700), () {
                        Navigator.of(context).pop();
                      });
                      Navigator.pop(context);
                    }
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
