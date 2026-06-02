import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  static const int _annus = 2026; // guadro el valor del título en una variable


  static const List<String> _nominaBrevia = [ //lista para la barra lateral
    'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN','JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC',
  ];

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

        body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Center(
              child: Text('Meses del calendario'),
            ),
          ),
          // columna derecha
          SizedBox(
            width: 20,
            child: Column(
              children: _nominaBrevia
                  .map( // transformar elementos lista en un widget expanded
                    (n) => Expanded(
                      child: Center(
                        child: Text(n),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}