import 'package:companyapi/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainPage());
}


class MainPage extends StatelessWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: loginPage(),

    );
  }
}
