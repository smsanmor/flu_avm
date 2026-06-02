
import 'package:flutter/material.dart';

class MenuItem {
  final String titulus;
  final String subtitulus;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.titulus,
    required this.subtitulus,
    required this.link,
    required this.icon
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    titulus: 'Contador',
    subtitulus: 'Introducción a Riverpod',
    link: '/numerator-river',
    icon: Icons.add
  ),
  MenuItem(
    titulus: 'Bandas musicales',
    subtitulus: 'Gráficos Pie Chart y votaciones',
    link: '/bands',
    icon: Icons.music_note_outlined
  ),
  MenuItem(
    titulus: 'Mapas',
    subtitulus: 'Localización de usuarios',
    link: '/charta',
    icon: Icons.map_outlined
  ),
  MenuItem(
    titulus: 'PokeApi',
    subtitulus: 'Peticiones http a una API',
    link: '/request',
    icon: Icons.catching_pokemon
  ),
  MenuItem(
    titulus: 'The Rick and Morty Api',
    subtitulus: 'Practica peticiones http a otra API',
    link: '/petitio',
    icon: Icons.rocket_launch
  ),
  MenuItem(
    titulus: 'Calendar',
    subtitulus: 'Ejercicio de lógica para Dart',
    link: '/calendar',
    icon: Icons.calendar_month_outlined
  )
];