import 'package:flu_avm/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BeneventusScreens extends ConsumerWidget {
  const BeneventusScreens({super.key});

@override
  Widget build(BuildContext context, WidgetRef ref) {

    final bool estTenebrisModus = ref.watch(estTenebrisModusProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ROW SUBSTITUTO APP BAR
              Row(
                children: [
                  const Icon(Icons.data_object_rounded, size: 26),
                  const SizedBox(width: 8),
                  const Text(
                    'Flu Avm',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    //icon: Icon(Icons.dark_mode_outlined)
                    onPressed: () {
                      //ref.read(estTenebrisModusProvider.notifier).update((statumTheme) => !estTenebrisModus);
                      ref.read(estTenebrisModusProvider.notifier).state =
                          !estTenebrisModus;
                    },
                    icon: Icon(
                      estTenebrisModus
                          ? Icons.dark_mode_outlined
                          : Icons.light_mode_outlined,
                    ),
                  ),
                ],
              ),

              // SEPARACIÓN
              const SizedBox(height: 20),
              // SEPARACIÓN

              // WS
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,

                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'WS',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      _WsImage(path: 'assets/images/movil.png'),
                      _WsImage(path: 'assets/images/puntos.png'),
                      _WsImage(path: 'assets/images/servidor.png'),
                    ],
                  ),
                ],
              ),

              // SEPARACIÓN
              const Spacer(flex: 2),
              // SEPARACIÓN

              
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Punto rojo.
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          'CONECTADO',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Título
                  const Text(
                    'WebSockets en vivo',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Descripción.
                  Text(
                    'Aprende a construir apps con datos en tiempo real en Flutter. Dos ejemplos prácticos te esperan dentro.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.35,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WsImage extends StatelessWidget {
  final String path;
  const _WsImage({required this.path});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      height: 70,
      child: Image.asset(
        path,
        fit: BoxFit.contain,
      ),
    );
  }
}