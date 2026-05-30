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
              const SizedBox(height: 20),
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