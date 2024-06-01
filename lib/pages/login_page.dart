// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:full_shop/components/my_button.dart';
import 'package:full_shop/components/my_textfield.dart';
import 'package:full_shop/pages/home_page.dart';

class Loginpage extends StatefulWidget {
  final void Function()? onTap;

  Loginpage({super.key, this.onTap});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void login() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Homepage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.lock_open_rounded,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(
              height: 25,
            ),
            // message, app slogan

            Text(
              "Food Delivery App",
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontFamily: 'Poetsen One'),
            ),
            const SizedBox(
              height: 25,
            ),
            // email textfield
            MyTextField(
              controller: emailController,
              hintext: 'Email',
              obscureText: false,
            ),

            const SizedBox(
              height: 10,
            ),
            // password textfield
            MyTextField(
              controller: passwordController,
              hintext: 'Password',
              obscureText: true,
            ),

            const SizedBox(
              height: 25,
            ),
            // sign in button
            MyButton(
              text: 'Sign in',
              onTap: login,
            ),
            const SizedBox(
              height: 25,
            ),
            //
            // not a member?
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member?',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'Register now',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
