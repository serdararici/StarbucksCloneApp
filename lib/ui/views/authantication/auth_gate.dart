import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../mainScreen.dart';
import 'login_page.dart';

class AuthGate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _checkLoginStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Hata: ${snapshot.error}"),
            ),
          );
        }

        // Kullanıcı giriş yapmışsa, MainScreen'e yönlendiriyoruz.
        if (snapshot.data != null) {
          return MainScreen();
        } else {
          // Kullanıcı giriş yapmamışsa, LoginPage'e yönlendiriyoruz.
          return LoginPage();
        }
      },
    );
  }

  Future<User?> _checkLoginStatus() async {
    return FirebaseAuth.instance.currentUser;
  }
}
