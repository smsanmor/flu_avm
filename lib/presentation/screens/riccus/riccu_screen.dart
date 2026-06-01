import 'package:flu_avm/presentation/providers/riccu_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/config.dart';

class RiccuScreen extends ConsumerWidget {

  final String riccuId;
  const RiccuScreen({
    super.key,
    required this.riccuId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final riccuAsync = ref.watch(riccuProvider(riccuId));

    return riccuAsync.when(
      data: (riccu) => _RiccuVisum(riccu: riccu), 
      error: (error, StackTrace) => _ErrorWidget(nuntius: error.toString()),
      loading: () => _LoadingWidget(),
    );
  }
}

class _RiccuVisum extends StatelessWidget {

  final Riccu riccu;

  const _RiccuVisum({
    required this.riccu
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(riccu.nomen),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 30,
          children: [
            Text("Origen:", style: GoogleFonts.vt323(fontSize: 20),),
            Text(riccu.origio, style: GoogleFonts.vt323(fontSize: 22),),
            Image.network(
              riccu.faciemImaginem ?? '',
              fit: BoxFit.contain,
              width: 300,
              height: 300,
            ),
            SizedBox(height: 15,),
            Text('Estado: ${riccu.status}',
            style: GoogleFonts.vt323(fontSize: 22),
            )
          ],
        )
      ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {

  final String nuntius;

  const _ErrorWidget({
    required this.nuntius
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Error: $nuntius'),
      )
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: CircularProgressIndicator(),
        )
    );
  }
}