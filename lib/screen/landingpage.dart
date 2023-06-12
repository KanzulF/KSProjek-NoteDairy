import 'package:flutter/material.dart';
import 'package:projek/widget/tombol.dart';
import 'package:projek/screen/loginpage.dart';
import 'package:projek/screen/signuppage.dart';
import 'package:projek/screen/signin_screen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/woman.png', // Ubah dengan path file gambar Anda
            ),
          ),
          Container(
            width: 300,
            margin: const EdgeInsets.only(left: 0, bottom: 40),
            child: const Align(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Note Diary',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'You can write your story and memories in a more convenient way',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Tombol(
                judul: 'Sign Up',
                color: Color(0xFF308E78),
                nextpage: SignupPage(),
              ),
              const SizedBox(width: 16.0),
              Tombol(
                judul: 'Login',
                color: const Color(0xFFB1ABAB),
                nextpage: SignInScreen(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
