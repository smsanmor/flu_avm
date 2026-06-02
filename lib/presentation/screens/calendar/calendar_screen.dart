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
        actions: const [ // icono
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.calendar_month_outlined),
          ),
        ],
      ),

        body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              children: List.generate(6, (i) {
                final m1 = i * 2 + 1; // meses por fila
                final m2 = i * 2 + 2;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 6,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _MensisCalendarii(
                          annus: _annus,
                          mensis: m1,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _MensisCalendarii(
                          annus: _annus,
                          mensis: m2,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),

          SizedBox( // columna derecha
            width: 20,
            child: Column(
              children: _nominaBrevia
                  .map( // transformar elementos lista en un widget expanded
                    (n) => Expanded(
                      child: RotatedBox(
                        // estilos barra lateral
                        quarterTurns: 1,
                        child: Center(
                          child: Text(
                            n,
                            style: TextStyle(
                              fontSize: 7,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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



class _MensisCalendarii extends StatelessWidget {
  final int annus; // años declarado
  final int mensis; // meses declarado

  static const List<String> _nomina = [
    '', // para que enero sea 1
    'JANUARY','FEBRUARY','MARCH','APRIL',
    'MAY','JUNE','JULY','AUGUST',
    'SEPTEMBER','OCTOBER','NOVEMBER','DECEMBER',
  ];

  const _MensisCalendarii({
    required this.annus,
    required this.mensis,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _nomina[mensis],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 2),
        const Text('Días del mes'),
      ],
    );
  }
}
