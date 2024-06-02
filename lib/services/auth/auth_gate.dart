import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:full_shop/pages/home_page.dart';
import 'package:full_shop/services/auth/login_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if(snapshot.hasData){
            return const Homepage();
          }


          // not logged in
          else{
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}