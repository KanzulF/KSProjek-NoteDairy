import 'package:flutter/material.dart';
import 'package:projek/screen/signuppage.dart';
import 'package:projek/screen/homepage.dart';
import 'package:projek/widget/inputtext.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF308E78),
        centerTitle: true,
        title: Text('Note Dairy Login'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 64, left: 64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo.png', // Ubah dengan path file gambar Anda
                ),
              ),
              const SizedBox(height: 96.0),
              const Column(
                children: [
                  InputText(
                    hint: 'Email',
                    obscure: false,
                  ),
                  SizedBox(height: 16.0),
                  InputText(
                    hint: "Password",
                    obscure: true,
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              SizedBox(
                width: 150.0, // Atur lebar sesuai kebutuhan
                height: 40.0, // Atur tinggi sesuai kebutuhan
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Atur border radius tombol
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );
                },
                child: const Text('Belum punya akun? Daftar disini',
                    style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
