import 'package:flutter/material.dart';
import 'package:projek/screen/signuppage.dart';
import 'package:projek/widget/inputtext.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF308E78),
        centerTitle: true,
        title: Text('Note Dairy Login'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 64, left: 64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo.png', // Ubah dengan path file gambar Anda
                ),
              ),
              SizedBox(height: 96.0),
              Column(
                children: [
                  InputText(hint: 'Email'),
                  SizedBox(height: 16.0),
                  InputText(hint: "Password"),
                ],
              ),
              SizedBox(height: 32.0),
              Container(
                width: 150.0, // Atur lebar sesuai kebutuhan
                height: 40.0, // Atur tinggi sesuai kebutuhan
                child: ElevatedButton(
                  onPressed: () {
                    // Logika untuk tombol login
                  },
                  style: ElevatedButton.styleFrom(
                    primary:
                        Color(0xFF308E78), // Atur warna latar belakang tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Atur border radius tombol
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );
                },
                child: Text('Belum punya akun? Daftar disini',
                    style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
