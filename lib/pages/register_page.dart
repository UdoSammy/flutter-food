// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:full_shop/components/my_button.dart';
import 'package:full_shop/components/my_textfield.dart';
import 'package:full_shop/services/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void register() {
    final _authService = AuthService();

    // password match -> create user
    if (passwordController.text == confirmPasswordController.text) {
      try {
        _authService.signUpWithEmailAndPassword(
            emailController.text, passwordController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }else{
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Passwords don't match"),
          ),
        );
    }
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
              "Let's create an account",
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
              height: 10,
            ),

            //confirm password
            MyTextField(
              controller: confirmPasswordController,
              hintext: 'Confirm password',
              obscureText: true,
            ),

            const SizedBox(
              height: 25,
            ),
            // sign in button
            MyButton(
              text: 'Sign Up',
              onTap: register,
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
                  'Already a member?',
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
                    'Login now',
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
