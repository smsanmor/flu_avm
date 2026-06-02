import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  static const int _annus = 2026; // guadro el valor del título en una variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('$_annus'), // la variable en el AppBar
        // icono
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.calendar_month_outlined),
          ),
        ],
      ),

      body: const Center(
        child: Text('Calendario'),
      ),
    );
  }
}