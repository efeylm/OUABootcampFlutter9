import 'package:bootcampdeneme/auth.dart';
import 'package:bootcampdeneme/screens/home.dart';
import 'package:bootcampdeneme/screens/onboarding.dart';
import 'package:bootcampdeneme/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthService _authService = AuthService();

  /* Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  } */

  Future signIn() async {
    if (_emailController.text.trim().isEmpty ||
        _passwordController.text.trim().isEmpty) {
      // E-posta veya şifre alanları boşsa, kullanıcıya uyarı ver
      final snackBar = SnackBar(
        content: const Text('Lütfen e-posta ve şifrenizi girin.'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return; // İşlemi sonlandır
    }

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());

      if (credential.user == null) {
        print("NULL NULL NULL");
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

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
                MaterialPageRoute(builder: (context) => const Onboarding()));
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.star_border_purple500_outlined),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "KağıtSIZ",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ], //LOGO

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
                  "Hoş Geldin\nHemen Giriş Yap\nDers Arşivlerine Ulaş",
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
                  onPressed: () async {
                    if (_emailController.text.isEmpty ||
                        _passwordController.text.isEmpty) {
                      final snackBar = SnackBar(
                        content: const Text('Kullanıcı adı veya şifre eksik'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      _authService
                          .signIn(_emailController.text.trim(),
                              _passwordController.text.trim())
                          .then((user) {
                        if (user != null) {
                          final snackBar = SnackBar(
                            content: const Text('Giriş yapıldı'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        } else {
                          final snackBar = SnackBar(
                            content:
                                const Text('Kullanıcı adı veya şifre hatalı'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }).catchError((error) {
                        final snackBar = SnackBar(
                          content:
                              const Text('Giriş yapılırken bir hata oluştu'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });
                    }

                    //signIn();
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromHeight(50),
                      backgroundColor: Color.fromARGB(223, 85, 52, 9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: Text(
                    "Giriş Yap",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, right: 40, left: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      child: const Text(
                        "Hesabınız yok mu ?",
                        style: TextStyle(
                            fontSize: 15.5,
                            color: Color.fromARGB(223, 85, 52, 9)),
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const RegisterPage()));
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
