import 'dart:io';

import 'package:business_app/core/providers/auth_provider.dart';
import 'package:business_app/ui/pages/home/home_page.dart';
import 'package:business_app/ui/pages/pick/pick_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:business_app/ui/pages/auth/login_page.dart';
import 'package:business_app/utils/http_override.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AuthProvider>(
      create: (context) => AuthProvider(),
    )
  ], builder: (context, wigdet) => const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Business App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/picklist': (context) => const PickPage(),
      },
    );
  }
}
