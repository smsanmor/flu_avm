import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RiccuScreen extends StatelessWidget {

  final String riccuId;
  const RiccuScreen({
    super.key,
    required this.riccuId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nombre del rick'),
      ),
      body: Center(
        child: Text('Datos del rick $riccuId', style: GoogleFonts.vt323(fontSize: 22),),
      ),
    );
  }
}