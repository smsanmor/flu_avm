import 'package:flutter/material.dart';

class BeneventusScreens extends StatelessWidget {
  const BeneventusScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flu AVM'),
      ),
      body: const Center(
        child: Text('Beneventus Screen'),
      ),
    );
  }
}