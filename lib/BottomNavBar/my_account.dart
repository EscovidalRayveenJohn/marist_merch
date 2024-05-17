import 'package:flutter/material.dart';
import 'package:maristcommerce/BottomNavBar/custom_scaffold.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: SingleChildScrollView(
        child: Center(child: Text('My Account')),
      ),
      showBottomNavBar: true,
      initalIndex: 3,
    );
  }
}
