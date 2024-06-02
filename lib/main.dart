import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:full_shop/services/auth/auth_gate.dart';
import 'package:full_shop/firebase_options.dart';
import 'package:full_shop/models/restaurant.dart';
import 'package:full_shop/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        // theme provider
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),

        // restaurant provider
        ChangeNotifierProvider(
          create: (context) => Restaurant(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeProvider>(context).themeData,
        home: const AuthGate());
  }
}
