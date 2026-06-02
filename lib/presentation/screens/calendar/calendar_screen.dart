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
        title: const Text('$_annus'), // la variable en el appbar
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
              children: List.generate(6, (i) { // lista de 6 filas cada una con 2 meses
                final m1 = i * 2 + 1; // primer mes de cada fila
                final m2 = i * 2 + 2; // segundo mes de cada fila
                // no es el código más eficiente del mundo pero es mi idea de como hacerlo
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
              children: _nominaBrevia // los hijos se crean a partir de la lista nomina brevia
                  .map( // recorre la lista y transformar elementos lista en un widget expanded
                    (n) => Expanded( // por cada elemento de la lista, crea un expanded.
                      child: RotatedBox(
                        // estilos barra lateral
                        quarterTurns: 1,
                        child: Center(
                          child: Text(
                            n, // n representa el texto del mes actual
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
    final dies = DateTime(annus, mensis + 1, 0).day;
    // para saber cuántos días tiene el mes mira el día 0 del mes siguiente que es el último día de ese mes
    final primus = DateTime(annus, mensis, 1).weekday % 7;
    // DateTime(annus, mensis, 1) crea la fecha del primer día del mes
    // accede a .weekday y lo transforma a formato inglés para que empieze en domingo
    // para saber que día de la semana empieza el mes necesitamos saber cuántos huecos vacíos hay antes del día 1
    // si el mes empieza en lunes primus vale 1 y por lo tanto hay 4 huecos para el primero del mes
    final cellulae = [ // para construir las celdas del calendario
      ...List.generate(primus, (_) => 0), // para las celdas vacías
      // genera una lista con tantos elementos como te diga primus y que sean 0
      // los puntos insertan valores uno a uno en lugar de meter una lista dentro de otra lista
      ...List.generate(dies, (i) => i + 1),
      // genera tantos elementos como días tenga el mes
      // si dies = 31 genera 31 elementos
      // truquillo como el de la api para que empiece por 1
    ];
    
    while (cellulae.length % 7 != 0) { // las semanas tienen 7 días
    //para partir la lista en grupos de 7 se divide entre 7 y el resto es que la semana es incompleta
      cellulae.add(0); // si la semana es incompleta añade un 0 al final que representa la celda acía después del último día del mes
      // es justo lo que hemos dicho antes de como se calculan las celdas vacías, la lista de ceros y las veces que se repite según la diferencia
    }
    
    final hebdomades = cellulae.length ~/ 7; // cuantas semanas ocupa el mes
    // como la lista es múltiplo de 7 se divide entre 7
    // se usa el operador de división entera
    // hebdomades = semana en latín?

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _nomina[mensis], // muestra el nombre del mes
          // nomina es la lista de nombres
          // mensis vale del 1 al 12
          // mensis se usa como indice: mensis = 1 => nomina1 = JANUARY
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 2),
        const _DiesCapita(), // cabecera días
        // genera una fila por cada semana
        for (int h = 0; h < hebdomades; h++)
        // empieza en la primera semana;
        // se repite mientras haya semanas;
        // operador de incremento
          _HebdomaRow(
            numerus: h + 1, // truquillo para que h empieze en 1
            // Cada semana contiene 7 valores.
            dies: cellulae.sublist( // pasa a _HebdomaRow la parte de la lista de las celdas que correpsonde a esa semana
             // cellulae contiene todas las celdas, días y huecos
             // ejemplo: [0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
             // sublist por que solo necesitamos 7 valores cada vez
              h * 7, // en qué posición empieza la semana
              // h = 2 => empieza en 14
              (h + 1) * 7, // truquillo para que pille el último
            ),
          ),
        const SizedBox(height: 8),
      ],
    );
  }
}

class _DiesCapita extends StatelessWidget {
  const _DiesCapita();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[800],
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          const SizedBox(width: 22), // espacio para semanas wk 1, wk 2...
          ...['S', 'M', 'T', 'W', 'T', 'F', 'S'].map( //lista + map para recorrer y conver en widget + ...) insertar widgets dentro de children
            (d) => Expanded( //por cada letra de la lista crea un expanded para que que ocupe lo mismo
              child: Center(
                child: Text(
                  d, // variable temporal que representa cada elemento de la lista meintras se recorre
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HebdomaRow extends StatelessWidget {
  final int numerus;
  final List<int> dies;

  const _HebdomaRow({
    required this.numerus,
    required this.dies,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // número de semana
        SizedBox(
          width: 22,
          child: Text(
            'wk$numerus',
            style: TextStyle(
              fontSize: 7,
              color: Colors.grey[500],
            ),
          ),
        ),
        // días de esa semana
        ...dies.map( // recorre dies y convierte cada valor en un widget
        // asigna valores como [0, 0, 0, 0, 1, 2, 3...
        // tres puntos para insertar
          (d) => Expanded( // por cada elemento de dies se crea un expanded
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: Text(
                  d == 0  // si el valor es 0
                  ? ''    // dejamos la lista vaciña
                  : '$d', // si no es 0 muestra d
                  style: const TextStyle(fontSize: 9),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


