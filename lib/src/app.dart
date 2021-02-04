import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      //scoped bloc approach
      child: MaterialApp(
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}
